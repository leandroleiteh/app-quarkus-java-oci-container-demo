variable "region" {
  type = string
}

variable "tenancy_id_compartment" {
  type = string
  description = "OCID da compartment"
}

variable "subnet_public" {
  type = string
  description = "OCID da subnet publica (para o Gateway)"
}

variable "subnet_private" {
  type = string
  description = "OCID da subnet privada (para o container)"
}

variable "name_project" {
  type = string
}

variable "image_url" {
  type = string
  description = "Imagem do container a ser usado"
}