terraform {
  required_providers {
    ibm = {
      source = "IBM-Cloud/ibm"
      version = ">= 1.47.1"
    }
  }
}

provider "ibm" {
  ibmcloud_api_key = var.ibmcloud_api_key
  region = var.region
}

resource "ibm_resource_group" "resource_group" {
  name = "elastic_ilm"
}

output "resource_group_name" {
  value=ibm_resource_group.resource_group.name
}