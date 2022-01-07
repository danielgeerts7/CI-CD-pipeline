terraform {
  required_providers {
    ibm = {
      source  = "IBM-Cloud/ibm"
      version = "~> 1.37.1"
    }
  }
  cloud {
    organization = "devdaniels"

    workspaces {
      name = "ibm-daniels-workspace"
    }
  }
}

# Configure the IBM Provider
provider "ibm" {
  ibmcloud_api_key = var.ibm_cloud_api_key
  region           = var.region
}
