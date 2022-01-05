## Case study: CI/CD

See [CASE_STUDY.md](CASE_STUDY.md) for a detailed description of the project.

### Tools used:

- Docker + [Docker Compose](https://docs.docker.com/get-started/08_using_compose/)
- [Kubernetes](https://kubernetes.io/)
- [IBM Cloud Registry](https://cloud.ibm.com/docs/Registry)
- [IBM Cloud Kubernetes Services](https://cloud.ibm.com/docs/containers)
- [Terraform](https://registry.terraform.io/)

### Apps:

- /app :Node.JS

## CLI Cheat sheet:

### Makefile

`make compose`

`make build`

`make push API_KEY=..`

`make tf-create-workspace ENV=staging`

`make tf-init ENV=staging`

`make tf-plan ENV=staging`

See more make commands in [Makefile](Makefile)


#### Docker:

`$ docker-compose up -d --build`

Go to [localhost](http://localhost:80) to view Docker results.

`$ docker-compose push`

`$ docker-compose down`


#### Kubernetes:

`$ kubectl apply -f kubemanifests.yml`

Go to [localhost:32100](http://localhost:32100) to view Kubernetes results.

`$ kubectl delete -f kubemanifests.yml`

> [Optional] Check if Kubernetes works:
> 
> `$ kubectl get all`
> `$ kubectl exec -it my-node-app-557d99ff59-tc57w sh`
> `$ printenv | grep SERVICE`

#### Terraform:

`$ cd terraform`

`$ terraform init`

`$ terraform plan`

`$ terraform apply`

Go to [??](??) to view Terraform results.

`$ terraform destroy`
