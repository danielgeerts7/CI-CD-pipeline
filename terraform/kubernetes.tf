/* 
* https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/guides/getting-started
*/

terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.7.1"
    }
  }
}

# Configure Kubernetes provder
provider "kubernetes" {
  config_path = "~/.kube/config"
}

# Create Kubernetes namespace
resource "kubernetes_namespace" "cicd" {
  metadata {
    name = var.namespace
  }
}

# Create Kubernetes DEPLOYMENT
resource "kubernetes_deployment" "cicd" {
  metadata {
    name      = "nodeapp-deployment"
    namespace = kubernetes_namespace.cicd.metadata.0.name
  }
  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "MyNodeApp"
      }
    }
    template {
      metadata {
        labels = {
          app = "MyNodeApp"
        }
      }
      spec {
        container {
          image = "de.icr.io/cicd-casestudy/ibm-node-app:latest" #path = "/app"
          name  = "nodeapp-container"
          port {
            container_port = 3000
          }
        }
      }
    }
  }
}

# Create Kubernetes SERVICE
resource "kubernetes_service" "cicd" {
  metadata {
    name = "nodeapp-service"
  }
  spec {
    selector = {
      app = kubernetes_deployment.cicd.spec.0.template.0.metadata.0.labels.app
    }
    port {
      node_port   = 32100
      port        = 3000
      target_port = 3000
      protocol    = "TCP"
    }
    type = "NodePort"
  }
}