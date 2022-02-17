variable "instance_name" {}
variable "linux_image" {
  default = ""
}
variable "post_deployment_script" {
  default = ""
}
variable "project_id" {
  default = "gcp-guest"
}

module "sap_hana" {
  source = "https://storage.googleapis.com/cloudsapdeploy/terraform/latest/terraform/sap_hana/sap_hana_module.zip"
  
  project_id = "${var.project_id}"
  zone = "us-east1-b"
  machine_type = "n1-highmem-32"
  subnetwork = "default"
  linux_image = "${var.linux_image}"
  linux_image_project = "bct-prod-images"
  instance_name = "${var.instance_name}"
  post_deployment_script = "${var.post_deployment_script}"
}
