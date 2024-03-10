Terraform Script for Creating Backend, Frontend Machines, and MySQL RDS in AWS

This Terraform script automates the creation of backend and frontend machines, along with a MySQL RDS instance in AWS within the same region and availability zone (AZ), utilizing the default VPC or a new VPC if specified.

Prerequisites
Terraform installed on your machine. 
AWS account with appropriate permissions.
Instructions
Clone this repository to your local machine
git clone <repository-url>
Navigate to the directory containing the Terraform script:
cd <repository-directory>
Modify the aws configuration file to configure AWS credentials and customize region as needed.
aws configure
Initialize Terraform:
terraform init
Run Terraform to create the resources:
terraform apply
To avoid incurring unnecessary costs, ensure to destroy the resources created by Terraform after use:
terraform destroy
