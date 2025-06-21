# terraform-azure

This project is a Terraform configuration for deploying resources in Microsoft Azure. It is structured to facilitate the creation of a virtual network (VNet) and its associated resources in a modular way.

## Project Structure

- **modules/**: Contains reusable Terraform modules.
  - **vnet/**: Module for creating a virtual network.
    - **main.tf**: Main configuration for the VNet module.
    - **variables.tf**: Input variables for the VNet module.
    - **outputs.tf**: Outputs for the VNet module.
    - **README.md**: Documentation for the VNet module.
  
- **environments/**: Contains environment-specific configurations.
  - **dev/**: Development environment configuration.
    - **main.tf**: Main configuration for the development environment.
    - **variables.tf**: Input variables for the development environment.
    - **outputs.tf**: Outputs for the development environment.

- **provider.tf**: Provider configuration for Terraform, specifying Azure as the cloud provider.

- **variables.tf**: Input variables for the root module.

- **outputs.tf**: Outputs for the root module.

## Usage

1. **Initialize Terraform**: Run `terraform init` to initialize the working directory containing Terraform configuration files.

2. **Plan the Deployment**: Use `terraform plan` to create an execution plan.

3. **Apply the Configuration**: Execute `terraform apply` to apply the changes required to reach the desired state of the configuration.

4. **Destroy Resources**: If needed, run `terraform destroy` to remove all resources defined in the configuration.

## Requirements

- Terraform version 1.0 or higher.
- Azure account with appropriate permissions to create resources.

## Contributing

Contributions are welcome! Please submit a pull request or open an issue for any enhancements or bug fixes.
