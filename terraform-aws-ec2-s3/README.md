# Terraform EC2 and S3

Provisioned an Amazon Linux EC2 instance and an S3 bucket with Terraform, then refactored the instance into a reusable module. The same file created the instance, updated it in place, and destroyed it. Resources were removed after the lab so nothing was left running.

## What this shows

Infrastructure as code is a file that says what should exist. Terraform compares that file with AWS and with its state file, then creates, changes, or deletes only the difference.

The AWS console can launch the same server. A console template saves the settings for the next launch. It does not update the server already running, and it does not delete that server when the file changes. Terraform does.

## What I built

- An IAM user, `terraform-admin`, with console access disabled and an access key for the AWS CLI. Terraform used that key. The key was not written in the Terraform files.
- An EC2 instance from a current Amazon Linux 2023 AMI, type `t3.micro`, named from a tag.
- An in-place name change on that same instance. The plan was `0 to add, 1 to change, 0 to destroy`.
- An S3 bucket with `force_destroy` so cleanup did not fail on an empty bucket.
- A local module, `modules/ec2`, called from the root file with the instance type and name.
- A final `terraform destroy` that removed the bucket and the module instance together.

## Layout

```text
main.tf                 root: provider, module call, S3 bucket
variables.tf            bucket name, so the account ID is not hardcoded
outputs.tf              instance id and bucket name
modules/ec2/main.tf     AMI lookup and instance
modules/ec2/variables.tf
modules/ec2/outputs.tf
```

## A limit I hit

The lab asked for `t2.small`. This free-plan account returned `FreeTierRestrictionError`. A valid file can still be rejected by the account. I kept `t3.micro` and changed the Name tag instead. That still proved an in-place update, and it avoided a second instance.

## How to run

Requires Terraform 1.5 or newer and AWS credentials for an account that can create EC2 and S3. Do not commit the access key or `terraform.tfstate`.

```bash
cp terraform.tfvars.example terraform.tfvars
# set a globally unique bucket name in terraform.tfvars
terraform init
terraform plan
terraform apply
terraform destroy
```

## Security

- No access keys, CSV files, or state files are in this folder.
- The lab user used `AdministratorAccess` so the exercise could create EC2 and S3. A real workload should use a role limited to the actions this project needs.
- The instance had no key pair and no open SSH rule. It was a create-and-destroy proof, not a login target.

## Skills

Terraform, AWS provider, EC2, S3, IAM programmatic access, modules, state, plan and apply, destroy, free-tier limits.
