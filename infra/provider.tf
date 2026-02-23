terraform {

  required_version = ">= 1.5.0"

  required_providers {
    oci = {
      source = "oracle/oci"
      version = "7.30.0"
    }
  }
}

provider "oci" {
  region = "sa-saopaulo-1"
}