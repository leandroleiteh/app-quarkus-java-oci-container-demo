

resource "oci_artifacts_container_repository" "repo" {
  compartment_id = var.tenancy_id_compartment
  display_name = var.name_project
  is_immutable = false
  is_public = true
  }

data "oci_identity_availability_domains" "ads" {
  compartment_id = var.tenancy_id_compartment
}

resource "oci_container_instances_container_instance" "test_container_instance" {
  availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
  compartment_id      = var.tenancy_id_compartment


  shape_config {
    ocpus         = 1
    memory_in_gbs = 2
  }

  vnics {
    subnet_id = var.subnet_private
  }

  containers {
    display_name = var.name_project
    image_url    = var.image_url

    environment_variables = {
      QUARKUS_HTTP_HOST = "0.0.0.0"
      QUARKUS_HTTP_PORT = "8080"
    }
  }
  shape = ""
}

  resource "oci_apigateway_gateway" "api_gateway" {
    compartment_id = var.tenancy_id_compartment
    endpoint_type  = "PUBLIC"
    subnet_id      = var.subnet_public
    display_name   = "${var.name_project}-gateway"
  }


  resource "oci_apigateway_deployment" "api_deployment" {
    compartment_id = var.tenancy_id_compartment
    gateway_id     = oci_apigateway_gateway.api_gateway.id
    display_name   = "${var.name_project}-deployment"
    path_prefix    = "/v1"

    specification {
      routes {
        path    = "/up"
        methods = ["GET"]

        backend {
          type = "HTTP_BACKEND"

          url = "http://${oci_container_instances_container_instance.test_container_instance.vnics[0].private_ip}:8080/up"

          connect_timeout_in_seconds = 10
          read_timeout_in_seconds    = 30
        }
      }
    }
  }

