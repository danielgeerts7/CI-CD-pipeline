# Terraform file
variable "ibmcloud_api_key" {}
variable "region" {}

# Configure the IBM Cloud provider
terraform {
  required_providers {
    ibm = {
      source = "IBM-Cloud/ibm"
      version = "~> 1.12.0"
    }
  }
}


# Configure the IBM Provider
provider "ibm" {
  ibmcloud_api_key = var.ibmcloud_api_key
  region = var.region
}

# Create K8 cluster
data ibm_resource_group "resource_group" {
    name = "Default"
}

resource ibm_container_cluster "tfcluster" {
    name            = "tfcluster-casestudy-daniel-eu-de"
    datacenter      = "fra02" # Frankfurt, Germany
    machine_type    = "free" # the free IBM worker node
    hardware        = "shared"
    #public_vlan_id  = "<public_vlan_ID_dal10>"
    #private_vlan_id = "<private_vlan_ID_dal10>"

    kube_version = "1.17"

    default_pool_size = 1 # max 1 worker node allowed

    public_service_endpoint  = "true"
    private_service_endpoint = "true"

    resource_group_id = data.ibm_resource_group.resource_group.id
}

# https://cloud.ibm.com/docs/ibm-cloud-provider-for-terraform?topic=ibm-cloud-provider-for-terraform-tutorial-tf-clusters
