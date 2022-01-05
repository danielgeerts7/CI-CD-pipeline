/* 
* https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/guides/getting-started
* https://cloud.ibm.com/docs/ibm-cloud-provider-for-terraform?topic=ibm-cloud-provider-for-terraform-tutorial-tf-clusters
* https://cloud.ibm.com/docs/containers?topic=containers-cs_cluster_tutorial#cs_cluster_tutorial
*/

terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.7.1"
    }
    ibm = {
      source  = "IBM-Cloud/ibm"
      version = "~> 1.37.1"
    }
  }
}
