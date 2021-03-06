module "proxy_gke_americas" {
  source                      = "./gke"
  proxy_cluster_region        = "americas"
  proxy_service_account_email = "${google_service_account.proxy_service_account.email}"
  proxy_ports                 = "${var.proxy_ports}"
}

module "proxy_gke_emea" {
  source                      = "./gke"
  proxy_cluster_region        = "emea"
  proxy_service_account_email = "${google_service_account.proxy_service_account.email}"
  proxy_ports                 = "${var.proxy_ports}"
}

module "proxy_gke_apac" {
  source                      = "./gke"
  proxy_cluster_region        = "apac"
  proxy_service_account_email = "${google_service_account.proxy_service_account.email}"
  proxy_ports                 = "${var.proxy_ports}"
}

locals {
  "proxy_instance_groups" = {
    americas = "${module.proxy_gke_americas.proxy_instance_group}"
    emea     = "${module.proxy_gke_emea.proxy_instance_group}"
    apac     = "${module.proxy_gke_apac.proxy_instance_group}"
  }
}

output "proxy_instance_groups" {
  value = "${local.proxy_instance_groups}"
}
