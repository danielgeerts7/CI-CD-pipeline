/* 
* https://cloud.ibm.com/docs/ibm-cloud-provider-for-terraform?topic=ibm-cloud-provider-for-terraform-tutorial-tf-clusters
* https://cloud.ibm.com/docs/containers?topic=containers-cs_cluster_tutorial#cs_cluster_tutorial
*/

terraform {
  required_providers {
    ibm = {
      source = "IBM-Cloud/ibm"
      version = "~> 1.37.1"
    }
  }
}

# Configure the IBM Provider
provider "ibm" {
  ibmcloud_api_key = var.ibmcloud_api_key
  region           = var.region
}

# Create a namespace
resource "ibm_cr_namespace" "cr_namespace" {
  name = var.namespace
}

# Create an IBM Cloud infrastructure SSH key. You can find the SSH key surfaces in the infrastructure console under Devices > Manage > SSH Keys
resource "ibm_compute_ssh_key" "test_key_1" {
  label      = "test_key_1"
  public_key = var.ssh_public_key
}

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