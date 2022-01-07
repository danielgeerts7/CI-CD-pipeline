data "ibm_org" "org" {
  org = "devdaniels"
}

data "ibm_space" "space" {
  org   = "devdaniels"
  space = "casestudy-2021-space"
}

data "ibm_account" "account" {
  org_guid = data.ibm_org.org.id
}

resource "ibm_resource_instance" "kms_instance1" {
  name     = "test_kms"
  service  = "kms"
  plan     = "free"
  location = var.region
}

resource "ibm_kms_key" "test" {
  instance_id  = ibm_resource_instance.kms_instance1.guid
  key_name     = "test_root_key"
  standard_key = false
  force_delete = true
}

# Create a namespace
resource "ibm_cr_namespace" "cr_namespace" {
  name = var.namespace
}

# IBM cluster
resource "ibm_container_cluster" "tfcluster" {
  name              = var.clustername
  datacenter        = "fra02" # Frankfurt, Germany
  machine_type      = "free"  # the free IBM worker node
  hardware          = "shared"
  public_vlan_id    = "vlan"
  private_vlan_id   = "vlan"
  no_subnet         = true
  kube_version      = "1.21.7"
  default_pool_size = 1 # max 1 worker node allowed  worker_num        = 1

  kms_config {
    instance_id      = ibm_resource_instance.kms_instance1.guid
    crk_id           = ibm_kms_key.test.key_id
    private_endpoint = false
  }

  labels = {
    "test" = "test-pool"
  }

  webhook {
    level = "Normal"
    type  = "slack"
    url   = var.webhook_to_slack
  }
}

resource "ibm_service_instance" "service" {
  name       = "myservice${random_id.name.hex}"
  space_guid = data.ibm_space.space.id
  service    = var.service_offering
  plan       = var.plan
  tags       = ["my-service"]
}

resource "ibm_service_key" "key" {
  name                  = var.service_key
  service_instance_guid = ibm_service_instance.service.id
}

resource "ibm_container_bind_service" "bind_service" {
  cluster_name_id     = ibm_container_cluster.cluster.id
  service_instance_id = ibm_service_instance.service.id
  namespace_id        = "default"
}

data "ibm_container_cluster_config" "cluster_config" {
  cluster_name_id = ibm_container_cluster.cluster.id
}

resource "random_id" "name" {
  byte_length = 4
}