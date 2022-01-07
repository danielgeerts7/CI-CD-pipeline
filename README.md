# Case study: CI/CD

View [CASE_STUDY.md](CASE_STUDY.md) for a detailed description of the project.

[![Orchestration (Terraform)](https://github.com/danielgeerts7/cicd-pipeline/actions/workflows/terraform.yml/badge.svg)](https://github.com/danielgeerts7/cicd-pipeline/actions/workflows/terraform.yml)

[![Continuous Deployment (IKS)](https://github.com/danielgeerts7/cicd-pipeline/actions/workflows/ibm.yml/badge.svg)](https://github.com/danielgeerts7/cicd-pipeline/actions/workflows/ibm.yml)

[![Continuous Integration (node.js tests)](https://github.com/danielgeerts7/cicd-pipeline/actions/workflows/node.js.yml/badge.svg)](https://github.com/danielgeerts7/cicd-pipeline/actions/workflows/node.js.yml)

## Tools used:

- Docker + [Docker Compose](https://docs.docker.com/get-started/08_using_compose/)
- [Kubernetes](https://kubernetes.io/)
- [IBM Cloud Registry](https://cloud.ibm.com/docs/Registry)
- [IBM Cloud Kubernetes Services](https://cloud.ibm.com/docs/containers)
- [Terraform](https://registry.terraform.io/)

## Apps:

- /app :Node.JS

# CLI Cheat sheet:

## Makefile

Check [Makefile](Makefile) for more make commands. Some examples:

    make compose
    make build
    make push API_KEY=..
    make tf-create-workspace ENV=staging
    make tf-init ENV=staging
    make tf-plan ENV=staging

## Docker:

Go to [localhost](http://localhost:80) to view Docker results.

    $ docker-compose up -d --build
    $ docker-compose push
    $ docker-compose down
    
[Optional] Check if Docker containers are running
  
    $ docker container ls

## Kubernetes:

Go to [localhost:32100](http://localhost:32100) to view Kubernetes results.

    $ kubectl apply -f kubemanifests.yml
    $ kubectl delete -f kubemanifests.yml

[Optional] Check if Kubernetes works:

    > $ kubectl get all
    > $ kubectl exec -it my-node-app-557d99ff59-tc57w sh
    > $ printenv | grep SERVICE

## Terraform:

    $ cd terraform
    $ terraform init
    $ terraform plan
    $ terraform apply
    $ terraform destroy
   
