**<h1>production-grade-EKS-cluster</h1>**

**This is a production-grade EKS cluster provisioned with Terraform.** 

This project creates a secure, production-ready Amazon EKS cluster using Terraform with the following features:

## Multi-AZ high availability setup

-  Secure networking with public/private subnets

-  ALB Controller for ingress management

-  Bastion host for secure access

-  DevOps tools integration (Jenkins, SonarQube, Nexus)

-  Complete CI/CD pipeline infrastructure

## Architecture

**The infrastructure includes:**

-  VPC with public and private subnets across 2 availability zones

-  EKS Cluster with managed node groups in private subnets

-  ALB Controller for automatic load balancer provisioning

-  Bastion Host with DevOps tools pre-installed

-  ECR Repositories for container images

## Prerequisites

**Before you start, ensure you have the following tools installed:**
```bash
# Install Terraform
brew install terraform  # macOS
# or download from https://terraform.io

# Install AWS CLI
brew install awscli     # macOS
# or download from https://aws.amazon.com/cli/

# Install kubectl
brew install kubectl    # macOS
# or download from https://kubernetes.io/docs/tasks/tools/

# Configure AWS credentials
aws configure
```
## Project Structure
```
.
├── main.tf                    # Root module configuration
├── variables.tf               # Root variables
├── outputs.tf                 # Root outputs
├── providers.tf               # Provider configurations
├── terraform.tfvars           # Variable values
└── modules/
    ├── vpc/
    │   ├── main.tf            # VPC, subnets, NAT gateway, etc.
    │   ├── variables.tf       # VPC module variables
    │   ├── outputs.tf         # VPC module outputs
    │   └── tools-install.sh   # DevOps tools installation script
    ├── eks/
    │   ├── main.tf            # EKS cluster and node groups
    │   ├── variables.tf       # EKS module variables
    │   └── outputs.tf         # EKS module outputs
    └── alb-controller/
        ├── main.tf            # ALB controller IAM and service account
        ├── variables.tf       # ALB controller variables
        ├── outputs.tf         # ALB controller outputs
        └── iam_policy.json    # ALB controller IAM policy
```
## Configuration
1.  **Update terraform.tfvars with your specific values:**
```
project_name  = "your-project-name"
cidr_block    = "10.0.0.0/16"
key_pair_name = "your-aws-key-pair"
eks_name      = "your-cluster-name"
zone1         = "us-east-1a"
zone2         = "us-east-1b"
region        = "us-east-1"
env           = "dev"
eks_version   = "1.30"
```
2.  **Create an AWS Key Pair in your target region for SSH access to the bastion host.**

## Deployment
1.  **Initialize Terraform:**
   
*`terraform init`*

2.  **Format and validate the configuration:**

*`terraform fmt`*

*`terraform validate`*

3.  **Plan the deployment:**
   
*`terraform plan -var-file="terraform.tfvars"`*

4.  **Apply the configuration:**

*`terraform apply -var-file="terraform.tfvars"`*

## Accessing the Cluster

After deployment, you can access your EKS cluster through the bastion host:

-  SSH to the bastion host:

`ssh -i your-key.pem ubuntu@<bastion-public-ip>`

-  Configure kubectl (already done by user-data script):

`aws eks --region us-east-1 update-kubeconfig --name your-cluster-name`

-  Verify cluster access:

`kubectl get nodes`

## DevOps Tools

**The bastion host comes pre-installed with:**

-  **Jenkins** (port 8080) - CI/CD pipeline

-  **SonarQube** (port 9000) - Code quality analysis

-  **Nexus** (port 8081) - Artifact repository

-  **Docker** - Container runtime

-  **kubectl** - Kubernetes CLI

-  **AWS CLI** - AWS command line interface

-  **Terraform** - Infrastructure as Code

Access these tools via the bastion host's public IP and respective ports.

## ALB Controller

The ALB Controller is configured to automatically provision AWS Application Load Balancers when you create Kubernetes Ingress resources. The necessary IAM roles and service accounts are set up automatically.

## Security Features

-  **Private subnets** for EKS worker nodes

-  **NAT Gateway** for outbound internet access from private subnets

-  **Security groups** with minimal required access

-  **IAM roles** with least privilege principle

-  **OIDC provider** for service account authentication

## Scaling

The EKS node group is configured with auto-scaling:

-  **Minimum**: 1 node

-  **Desired**: 2 nodes

-  **Maximum**: 2 nodes (adjust as needed)

## Cleanup

To destroy the infrastructure:

`terraform destroy -var-file="terraform.tfvars"`

## Customization

-  This setup is modular and can be easily customized:

-  Modify instance types in modules/eks/main.tf

-  Adjust scaling parameters in the node group configuration

-  Add additional security groups or modify existing ones

-  Extend the DevOps tools installation script

## Troubleshooting

1.  **EKS cluster access issues**: Ensure your AWS credentials have the necessary permissions

2.  **Node group creation fails**: Check subnet tags and availability zones

3.  **ALB Controller issues**: Verify OIDC provider and IAM role configurations

## Contributing

Feel free to submit issues and enhancement requests!

## License

This project is licensed under the MIT License.
