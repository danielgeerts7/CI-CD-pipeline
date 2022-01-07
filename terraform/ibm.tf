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
  datacenter        = "fra02" # Frankfurt, Germany
  machine_type      = "free"  # the free IBM worker node
  hardware          = "shared"
  no_subnet         = true
  kube_version      = "1.21.7"
  default_pool_size = 1 # max 1 worker node allowed  worker_num        = 1

  webhook {
    level = "Normal"
    type  = "slack"
    url   = var.webhook_to_slack
  }
}

# resource "ibm_service_instance" "service" {
#   name       = "myservice-#${random_id.name.hex}"
#   space_guid = data.ibm_space.space.id
#   service    = "cloud-object-storage"
#   plan       = "free"
#   tags       = ["my-service"]
# }

# resource "ibm_service_key" "key" {
#   name                  = "myservicekey"
#   service_instance_guid = ibm_service_instance.service.id
# }

# resource "ibm_container_bind_service" "bind_service" {
#   cluster_name_id     = ibm_container_cluster.cluster.id
#   service_instance_id = ibm_service_instance.service.id
#   namespace_id        = "default"
# }

data "ibm_container_cluster_config" "cluster_config" {
  cluster_name_id = ibm_container_cluster.cluster.id
}

# resource "random_id" "name" {
#   byte_length = 4
# }