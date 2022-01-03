## Case study: CI/CD

See [CASE_STUDY.md](CASE_STUDY.md) for a detailed description of the project.

See [MY_PROCESS.md](MY_PROCESS.md) for an action log and some sidenotes.


### Tools used:

- Docker + [Docker Compose](https://docs.docker.com/get-started/08_using_compose/)
- [Kubernetes](https://kubernetes.io/)
- [Kompose](https://kompose.io/)
- [IBM Cloud Registry](https://cloud.ibm.com/docs/Registry)
- [IBM Cloud Kubernetes Services](https://cloud.ibm.com/docs/containers)

### Apps:

- Node.JS

## CLI Cheat sheet:

#### Docker:

`$ docker-compose up -d --build`

`$ docker-compose push`

`$ docker-compose down`

#### Kubernetes:

`$ kubectl apply -f kubemanifests.yml`

`$ kubectl get all`

`$ kubectl exec -it my-node-app-557d99ff59-tc57w sh`

`$ printenv | grep SERVICE`

#### Terraform:

`$ terraform plan`

`$ terraform apply`

`$ terraform plan`