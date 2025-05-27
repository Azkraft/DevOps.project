module "network" {
    source = "../../modules/network"
    name = "azanov-vpc"
    zone = var.zone
    v4_cidr_blocks = ["172.16.0.0/16"]
}

module "iam" {
    source = "../../modules/iam"
    name = "k8s"
    folder_id = var.folder_id
    role = "editor"
}

module "k8s_cluster" {
    source = "../../modules/k8s-cluster"
    name = "zonal-k8s-prod"
    network_id = module.network.network_id
    subnet_id = module.network.subnet_id
    zone = module.network.zone
    service_account_id = module.iam.sa_id
    node_service_account_id = module.iam.sa_id
}

module "node_group" {
    source = "../../modules/node-group"
    name = "k8s-node-group"
    node_count = var.node_count
    cluster_id = module.k8s_cluster.cluster_id
    subnet_id = module.network.subnet_id
}

module "valkey" {
    source = "../../modules/valkey"
    network_id = module.network.network_id
    subnet_id = module.network.subnet_id
    zone = module.network.zone
}

module "object-storage" {
    source = "../../modules/object-storage"
}