# BucketDemo - Multi-Cloud Storage Infrastructure

This repository contains Infrastructure as Code (IaC) configurations for NewCo's data orchestration demo. The setup provisions storage buckets across three major cloud providers to demonstrate our multi-cloud data orchestration capabilities.

## Overview

The demo creates equivalent storage resources across:
- **AWS S3** - Simple Storage Service bucket
- **Azure Storage** - Blob storage container 
- **Google Cloud Platform** - Cloud Storage bucket

This multi-cloud setup allows us to showcase how our data orchestration platform can seamlessly work across different cloud environments.

## Repository Structure

```
├── AWS/
│   ├── main.tf          # AWS S3 bucket configuration
│   ├── variables.tf     # AWS-specific variables
│   └── outputs.tf       # AWS resource outputs
├── Azure/
│   ├── main.tf          # Azure Storage Account and container
│   ├── variables.tf     # Azure-specific variables
│   └── outputs.tf       # Azure resource outputs
├── GCP/
│   ├── main.tf          # GCP Cloud Storage bucket
│   ├── variables.tf     # GCP-specific variables
│   └── outputs.tf       # GCP resource outputs
└── README.md            # This file
```

## Prerequisites

Before deploying the infrastructure, ensure you have:

1. **Terraform** installed (version 1.0+)
2. **Cloud Provider CLIs** configured:
   - AWS CLI with appropriate credentials
   - Azure CLI logged in (`az login`)
   - Google Cloud SDK with authentication (`gcloud auth login`)
3. **Required Permissions** in each cloud provider to create storage resources

## Deployment Instructions

### AWS S3 Bucket

```powershell
cd AWS
terraform init
terraform plan
terraform apply
```

### Azure Storage

```powershell
cd Azure
terraform init
terraform plan
terraform apply
```

### GCP Cloud Storage

```powershell
cd GCP
terraform init
terraform plan
terraform apply
```

## Configuration

Each cloud provider configuration can be customized through variables:

- **Bucket/Container Names**: Modify in respective `variables.tf` files
- **Regions/Locations**: Adjust deployment regions as needed
- **Access Policies**: Configure appropriate permissions for your use case

## Outputs

After deployment, each configuration outputs:
- Storage resource names
- Access endpoints
- Resource ARNs/IDs for integration

## Data Orchestration Demo

Once deployed, these storage buckets serve as:
- **Data Sources**: Ingest data from various sources
- **Processing Staging**: Temporary storage during data transformation
- **Output Destinations**: Final processed data storage
- **Cross-Cloud Transfer**: Demonstrate data movement between providers

## Cleanup

To remove all resources:

```powershell
# Clean up each environment
cd AWS && terraform destroy
cd ../Azure && terraform destroy  
cd ../GCP && terraform destroy
```

## Security Notes

- All Terraform state files are excluded from version control
- Ensure proper IAM/RBAC permissions are configured
- Review access policies before production deployment
- Consider encryption at rest and in transit requirements

## Contributing

When making changes:
1. Test configurations in a development environment first
2. Follow naming conventions for consistency across cloud providers
3. Update this README if adding new components

## Support

For questions about this demo infrastructure, contact the NewCo infrastructure team.

---

**NewCo Data Orchestration Platform Demo**  
*Showcasing seamless multi-cloud data operations*
