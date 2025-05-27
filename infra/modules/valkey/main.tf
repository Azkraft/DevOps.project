resource "yandex_mdb_redis_cluster" "my_cluster" {
  name        = "valkey"
  environment = "PRESTABLE"
  network_id  = var.network_id

  config {
    password = "password"
    version  = "8.0-valkey"
  }

  resources {
    resource_preset_id = "hm1.nano"
    disk_size          = 16
  }

  host {
    zone      = var.zone
    subnet_id = var.subnet_id
  }

  maintenance_window {
    type = "ANYTIME"
  }
}