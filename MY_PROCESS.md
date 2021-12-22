## Process of the case study

### Setup CI/CD tooling:

1. Angular as content for container
2. Dockerize Angular container
3. After consideration, replaced Angular with Node.js
4. Kubernize the docker-compose.yml to kubemanifests.yml, through $ kompose convert -f docker-compose.yml -o kubemanifests.yml
5. Edit kubemanifests.yml to fit the clusters
6. Create cluster on IBM Cloud
7. ibmcloud cli installed
8. Push Docker containers to IBM Registry
9. Setup 'Deploy to IBM Cloud Kubernetes Service' under Github Actions
10. Setup secrets in GitHub
11. Refactor source to fit pipeline standards


### Learning thoughts:

- Documentation of Cloud vendor is valuable
- t