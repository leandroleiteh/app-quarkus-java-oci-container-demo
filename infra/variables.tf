variable "region" {
  type = string
  default = "sa-saopaulo-1"
}

variable "tenancy_id_compartment" {
  type = string
  description = "OCID da compartment"
  default = "ocid1.tenancy.oc1..aaaaaaaab6dmrqo6iaubszhvs7n5srxcuhorvzugd33tvwbi56ydo7656xza"
}

variable "subnet_public" {
  type = string
  description = "OCID da subnet publica (para o Gateway)"
  default = "ocid1.subnet.oc1.sa-saopaulo-1.aaaaaaaaks4bhpeztg5g2h5bz3pwkdu7pwq5varorawqwmqw2o4dvqfyolsa"
}

variable "subnet_private" {
  type = string
  description = "OCID da subnet privada (para a Function)"
  default = "ocid1.subnet.oc1.sa-saopaulo-1.aaaaaaaaqcnc3hknv5eu2i4wpsjmayuigflyuwmpoyauq3pgr6ywxkrkfy7a"
}

variable "name_project" {
  type = string
  default = "workshop-aovivo-quarkus-brasil-jug-devs-java"
}

variable "image_url" {
  type = string
  description = "Imagem do container a ser usado"
  default = "gru.ocir.io/grltxnor0awu/quarkus-app-teste3/health:v12"
}