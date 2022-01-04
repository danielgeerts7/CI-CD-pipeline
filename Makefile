run-docker:
	docker-compose up --build

run-kubernetes:
	kubectl apply -f kubemanifests.yml
