resource "yandex_vpc_network" "this" {
    name = var.name
}

resource "yandex_vpc_subnet" "this" {
    v4_cidr_blocks = var.v4_cidr_blocks
    zone = var.zone
    network_id = yandex_vpc_network.this.id
}

resource "yandex_vpc_security_group" "this" {
  name        = "sg"
  network_id  = yandex_vpc_network.this.id

  ingress {
      protocol          = "ANY"
      description       = "Allow incoming traffic from members of the same security group"
      from_port         = 0
      to_port           = 65535
      predefined_target = "self_security_group"
  }

  egress {
      protocol          = "ANY"
      description       = "Allow outgoing traffic to members of the same security group"
      from_port         = 0
      to_port           = 65535
      predefined_target = "self_security_group"
    }

  egress {
    protocol = "TCP"
    port = 80
    v4_cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    protocol = "TCP"
    port = 443
    v4_cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    protocol = "TCP"
    port = 22
    v4_cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    protocol = "TCP"
    port = 80
    v4_cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    protocol = "TCP"
    port = 22
    v4_cidr_blocks = ["0.0.0.0/0"]
  }
}