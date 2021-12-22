## Case study: CI/CD

For the last few weeks you have been working on various topics that involde the whole devops process. From the  principles of DevOps culture to the tools used to enable a DevOps approach.

The goal of the case study is to apply what you learned and deepen your knowledge by creating a delivery chain as a DevOps team. In this case this means building, deploying, maintaining and running an application in Kubernetes using CI/CD.

### Pre-requirements:

- Free ibmcloud kubernetes cluster access
- An application to deploy (in a git repo)
- Docker registry to push images to
- Jira Access 
- Bitbucket access

### Goals:

- Set up CI tooling of your choice (note: expose the application through a node port service, a loadbalancer/ingress does not work on a free cluster)
  - Run a pipeline on every pull request to master where you run unit tests. Merge only on a successful build.
  - Run a pipeline on a merge with master which pushes the latest built docker image to a docker registry (so, rebuild the image, tag it with a version and push it to a docker registry)
- Set up CD tooling (your choice)
  - Be able to deploy a dockerized hello world application to a free ibmcloud kubernetes cluster using CD tooling (expose using a nodePort service)
- Create user stories in Jira to be able to reach these goals.

### Optional:

- After deployment, set up logging and/or monitoring for your deployed application
- Extend the CI pipeline to also include vulerability scanning or any other feature you think is useful (but make sure to reason as to why it is important!)