# Configure the OpenStack Provider
provider "openstack" {
    user_name  = "${var.user_name}"
    tenant_name = "${var.tenant_name}"
    password  = "${var.password}"
    auth_url  = "${var.auth_url}"
    domain_name = "${var.domain_name}"
}

resource "openstack_compute_instance_v2" "terraform-server" {
  count = 8
  name = "terraform-server"
  image_id = "ec415914-6caa-428e-b72f-77a655342ffc"
  flavor_id = "f4c1349e-59bf-47af-8960-be65c781d792"
  key_pair = "${var.key_pair_name}"
  security_groups = ["default"]

  network {
    name = "provider"
  }

}


