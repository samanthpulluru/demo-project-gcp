locals {
  region           = "us-central1"
  zone             = "us-central1-a"
  environment_name = "dev"
  tags = {
    env     = "${local.environment_name}"
    project = "demo-project"
  }
}

#Declaring the configuration for the provider selected
provider "google" {
  project     = var.project_id
  region      = local.region
  zone        = local.zone
  credentials = var.gcp_credentials
}

provider "google-beta" {
  project     = var.project_id
  region      = local.region
  zone        = local.zone
  credentials = var.gcp_credentials
}

data "google_client_config" "default" {}

provider "kubernetes" {
  host                   = "https://${module.gke.endpoint}"
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(module.gke.ca_certificate)
}

module "gcp-network" {
  source  = "terraform-google-modules/network/google"
  version = ">= 4.0.1"

  project_id   = var.project_id
  network_name = var.network

  subnets = [
    {
      subnet_name   = var.subnetwork
      subnet_ip     = "10.0.0.0/17"
      subnet_region = var.region
    },
  ]

  secondary_ranges = {
    (var.subnetwork) = [
      {
        range_name    = var.ip_range_pods_name
        ip_cidr_range = "192.168.0.0/18"
      },
      {
        range_name    = var.ip_range_services_name
        ip_cidr_range = "192.168.64.0/18"
      },
    ]
  }
}

module "gke" {
  source                     = "terraform-google-modules/kubernetes-engine/google"
  project_id                 = var.project_id
  name                       = var.cluster_name
  regional                   = var.region_flag
  region                     = var.region
  zones                      = var.zones
  network                    = module.gcp-network.network_name
  subnetwork                 = module.gcp-network.subnets_names[0]
  ip_range_pods              = var.ip_range_pods_name
  ip_range_services          = var.ip_range_services_name
  create_service_account     = var.create_service_account
  horizontal_pod_autoscaling = var.horizontal_pod_autoscaling
    
  node_pools = [
    {
      name               = var.node_pool_name
      machine_type       = var.machine_type
      node_locations     = var.node_locations
      min_count          = var.min_count
      max_count          = var.max_count
      disk_size_gb       = var.disk_size
      disk_type          = var.disk_type
      image_type         = var.image_type
      auto_repair        = var.auto_repair
      auto_upgrade       = var.auto_upgrade
      service_account    = var.terraform_service_account
      initial_node_count = var.node_init_count
    }
  ]
}
