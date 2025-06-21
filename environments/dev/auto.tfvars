app_name            = "ilker"
environment         = "dev"
location            = "australiaeast"

address_space       = ["10.0.0.0/16"]

subnet_prefixes     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
subnet_names        = ["${var.app_name}-${var.environment}-a", "${var.app_name}-${var.environment}-b", "${var.app_name}-${var.environment}-c"]

tags = {
  environment = var.environment
  owner       = "Terraform"
}
