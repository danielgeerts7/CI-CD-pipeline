GITHUB_SHA?=latest
NAMESPACE=ibm-daniels-workspace
LOCAL_TAG=cicd-casestudy-app:$(GITHUB_SHA)
BASE_REMOTE=icr.io
REMOTE_TAG=$(BASE_REMOTE)/$(NAMESPACE)/$(LOCAL_TAG)

###

compose:
	docker-compose up --build -d

###

check-api-key:
ifndef API_KEY
	$(error Please set API_KEY=..)
endif

build:
	docker build -t $(LOCAL_TAG) ./app

# push:
# 	docker tag $(LOCAL_TAG) danielgeerts7/$(LOCAL_TAG)
# 	docker push danielgeerts7/$(LOCAL_TAG)

push: check-api-key
	ibmcloud login --apikey $(API_KEY)
	ibmcloud cr login
	ibmcloud cr namespace-add $(NAMESPACE)
	docker login -u iamapikey -p $(API_KEY) $(BASE_REMOTE)
	docker tag $(LOCAL_TAG) $(REMOTE_TAG)
	docker push $(REMOTE_TAG)

###

check-env:
ifndef ENV
	$(error Please set ENV=[staging|prod])
endif

### 

tf-create-workspace: check-env
	cd terraform && \
		terraform workspace new $(ENV)

tf-init: check-env
	cd terraform && \
		terraform workspace select $(ENV) && \
		terraform init

tf-plan: check-env
	cd terraform && \
	terraform workspace select $(ENV) && \
		terraform plan

tf-apply: check-env
	cd terraform && \
	terraform workspace select $(ENV) && \
		terraform apply

###



ZONE=eu-de
CONTAINER_NAME=my-node-app
# SSH_STRING=daniel@cicd-casestudy-$(ENV)

# ssh: check-env
# 	ibmcloud compute ssh $(SSH_STRING) \
# 		--project=$(NAMESPACE) \
# 		--zone=$(ZONE)

# ssh-cmd: check-env
# 	@ibmcloud compute ssh $(SSH_STRING) \
# 		--project=$(NAMESPACE) \
# 		--zone=$(ZONE) \
# 		--command="$(CMD)"

# deploy: check-env
# #	$(MAKE) ssh-cmd CMD='ibmcloud login'
# 	$(MAKE) ssh-cmd CMD='docker login -u iamapikey -p <api_key> icr.io'

# 	@echo "pulling new container image..."
# 	$(MAKE) ssh-cmd CMD='docker pull $(REMOTE_TAG)'
# 	@echo "removing old container..."
# 	-$(MAKE) ssh-cmd CMD='docker container stop $(CONTAINER_NAME)'
# 	-$(MAKE) ssh-cmd CMD='docker container rm $(CONTAINER_NAME)'
# 	@echo "starting new container..."
# 	@$(MAKE) ssh-cmd CMD='\
# 		docker run -d --name=$(CONTAINER_NAME) \
# 			--restart=unless-stopped \
# 			-p 3000:3000 \
# 			-e PORT=3000 \
# 			$(REMOTE_TAG) \
# 			'
