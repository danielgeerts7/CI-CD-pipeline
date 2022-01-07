GITHUB_SHA?=latest
NAMESPACE=ibm-daniels-workspace
LOCAL_TAG=cicd-casestudy-app:$(GITHUB_SHA)
BASE_REMOTE=icr.io
REMOTE_TAG=$(BASE_REMOTE)/$(NAMESPACE)/$(LOCAL_TAG)

### Run this local

compose:
	docker-compose up --build -d

### Push to Container Registry

build:
	docker build -t $(LOCAL_TAG) ./app
	
# # Push image to Docker Hub
# push:
# 	docker tag $(LOCAL_TAG) danielgeerts7/$(LOCAL_TAG)
# 	docker push danielgeerts7/$(LOCAL_TAG)

### Push image to IBM Cloud
check-api-key:
ifndef API_KEY
	$(error Please set API_KEY=..)
endif

push: check-api-key
	ibmcloud login --apikey $(API_KEY)
	ibmcloud cr login
	ibmcloud cr namespace-add $(NAMESPACE)
	docker login -u iamapikey -p $(API_KEY) $(BASE_REMOTE)
	docker tag $(LOCAL_TAG) $(REMOTE_TAG)
	docker push $(REMOTE_TAG)

### Terraform

check-env:
ifndef ENV
	$(error Please set ENV=[staging|prod])
endif

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
