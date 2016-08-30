# Configure the OpenStack Provider
provider "openstack" {
    user_name   = "${var.user_name}"
    tenant_name = "${var.tenant_name}"
    password    = "${var.password}"
    auth_url    = "${var.auth_url}"
    domain_name = "${var.domain_name}"
}

resource "openstack_compute_instance_v2" "terraform-server" {
  count           = "${var.instance_count}"
  name            = "terraform-server-${count.index + 1}"
  image_id        = "${var.image_id}"
  flavor_id       = "${var.flavor_id}"
  key_pair        = "${var.key_pair_name}"
  security_groups = ["${var.security_groups}"]

  network {
    name = "provider"
  }

}


