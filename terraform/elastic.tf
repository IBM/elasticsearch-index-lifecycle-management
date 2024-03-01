resource "ibm_database" "elasticdb" {
  resource_group_id = ibm_resource_group.resource_group.id
  name              = "elastic-ilm"
  service           = "databases-for-elasticsearch"
  plan              = "enterprise"
  location      = var.region
  adminpassword = var.elastic_password
}

data "ibm_database_connection" "es_connection" {
  endpoint_type = "public"
  deployment_id = ibm_database.elasticdb.id
  user_id       = "admin"
  user_type     = "database"
}

output "es_url" {
  value     = "https://admin:${ibm_database.elasticdb.adminpassword}@${data.ibm_database_connection.es_connection.https[0].hosts[0].hostname}:${data.ibm_database_connection.es_connection.https[0].hosts[0].port}"
  sensitive = true
}