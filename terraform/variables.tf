variable "ibm_cloud_api_key" {
  type = string
}

variable "webhook_to_slack" {
  type = string
}

variable "region" {
  type    = string
  default = "eu-de"
}

variable "namespace" {
  type    = string
  default = "ibm-daniels-workspace"
}

variable "clustername" {
  type    = string
  default = "tfcluster-daniel"
}
