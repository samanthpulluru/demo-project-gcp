variable "project_id" {
  description = "The project ID to host the cluster in"
  default     = "ops-hiring-case-study-pulluru"
}

variable "cluster_name" {
  description = "The name for the GKE cluster"
  default     = "demo-project-gke-cluster"
}

variable "region_flag" {
  description = "Boolean flag to determine regional presence of cluster"
  default     = true
}

variable "region" {
  description = "The region to host the cluster in"
  default     = "us-central1"
}

variable "zones" {
  description = "list of zones the cluster has to be deployed across"
  default     = ["us-central1-a", "us-central1-b", "us-central1-f"]
}

variable "network" {
  description = "The VPC network created to host the cluster in"
  default     = "gke-network"
}

variable "subnetwork" {
  description = "The subnetwork created to host the cluster in"
  default     = "gke-subnet"
}

variable "ip_range_pods_name" {
  description = "The secondary ip range to use for pods"
  default     = "ip-range-pods"
}

variable "ip_range_services_name" {
  description = "The secondary ip range to use for services"
  default     = "ip-range-scv"
}

variable "create_service_account" {
  description = "Boolean flag to declare creation of a K8s service account"
  default     = true
}

variable "horizontal_pod_autoscaling" {
  description = "Boolean flag to implement auto pod scaling horizontally on the cluster"
  default     = true
}

variable "gcp_credentials" {
  type        = string
  sensitive   = true
  description = "Google Cloud service account credentials"
}

variable "node_pool_name" {
  description = "Name of the node pool associated with the cluster"
  default     = "default-node-pool"
}

variable "machine_type" {
  description = "Name of the machine type/size associated with the cluster"
  default     = "e2-medium"
}

variable "node_locations" {
  description = "list of locations the nodes can be deployed across"
  default     = "us-central1-b,us-central1-c"
}

variable "min_count" {
  description = "Minimum count of nodes the cluster can be operated on"
  default     = 3
}

variable "max_count" {
  description = "Maximum number of nodes the cluster can be scaled upto"
  default     = 5
}

variable "disk_size" {
  description = "Size of the disk associated with a node, in GB"
  default     = 50
}

variable "disk_type" {
  description = "Type of disk attached to a node"
  default     = "pd-standard"
}

variable "image_type" {
  description = "Type of image the nodes will be bootstrapped to"
  default     = "COS_CONTAINERD"
}

variable "auto_repair" {
  description = "Auto repair mode enabled for the nodes"
  default     = true
}

variable "auto_upgrade" {
  description = "Auto upgrade feature enabled for nodes/cluster"
  default     = true
}

variable "node_init_count" {
  description = "Cound of nods the cluster gets at the time of creation/restart"
  default     = 3
}

variable "terraform_service_account" {
  description = "Mail ID of the service account associated with the Terraform deployment"
  default     = "demo-project-terraform-service@ops-hiring-case-study-pulluru.iam.gserviceaccount.com"
}
