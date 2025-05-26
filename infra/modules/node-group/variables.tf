variable "cluster_id" {}
variable "name" {}
variable "subnet_id" {}
variable "instance_template_boot_disk_type" {
    default = "network-hdd"
}
variable "instance_template_boot_disk_size" {
    default = 70
}
variable "instance_template_resources_core" {
    default = 2
}
variable "instance_template_resources_memory" {
    default = 4
}
variable "node_count" {
    default = 1
}