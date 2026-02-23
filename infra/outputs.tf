output "namespace_registry" {
  value = oci_artifacts_container_repository.repo.namespace
}

output "container_private_ip" {
  value = oci_container_instances_container_instance.test_container_instance.vnics[0].private_ip
}

output "url_final_para_teste" {
  value = "https://${oci_apigateway_gateway.api_gateway.hostname}/v1/up"
}