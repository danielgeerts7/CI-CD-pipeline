data "ibm_org" "org" {
  name = var.ibm_cloud_org
}

data "ibm_space" "space" {
  org  = var.ibm_cloud_org
  name = var.ibm_cloud_space
}

data "ibm_account" "account" {
  org_guid = data.ibm_org.org.id
}

# Create a namespace
resource "ibm_cr_namespace" "cr_namespace" {
  name = var.namespace
}

# IBM cluster
resource "ibm_container_cluster" "cluster" {
  name              = var.clustername
  datacenter        = var.datacenter
  machine_type      = "free"
  hardware          = "shared"
  no_subnet         = true
  kube_version      = "1.21.7"
  default_pool_size = 1

  webhook {
    level = "Normal"
    type  = "slack"
    url   = var.webhook_to_slack
  }
}

data "ibm_container_cluster_config" "cluster_config" {
  cluster_name_id = ibm_container_cluster.cluster.id
}
