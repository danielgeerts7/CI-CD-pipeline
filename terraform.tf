/* 
* https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/guides/getting-started
* https://cloud.ibm.com/docs/ibm-cloud-provider-for-terraform?topic=ibm-cloud-provider-for-terraform-tutorial-tf-clusters
* https://cloud.ibm.com/docs/containers?topic=containers-cs_cluster_tutorial#cs_cluster_tutorial
*/

# IBM cluster
resource "ibm_container_cluster" "tfcluster" {
  name              = "tfcluster-daniel"
  datacenter        = "fra02" # Frankfurt, Germany
  machine_type      = "free"  # the free IBM worker node
  hardware          = "shared"
  public_vlan_id    = "vlan"
  private_vlan_id   = "vlan"
  no_subnet         = true
  kube_version      = "1.21.7"
  default_pool_size = 1 # max 1 worker node allowed
}


# K8
resource "kubernetes_namespace" "cicd" {
  metadata {
    name = "cicd-namespace"
  }
}

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