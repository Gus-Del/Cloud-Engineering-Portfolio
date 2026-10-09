# Ansible NGINX Web Fleet

Infrastructure and configuration for a small web fleet on AWS. Terraform provisions one Ansible control node and three Amazon Linux 2023 web servers in `us-east-1`. Ansible, running only on the control node, installs and starts NGINX on the three web servers.

The control node and the web servers stay separate. The control node holds the inventory, the playbook, and a locked-down copy of the SSH key. The web servers only run NGINX.

## What this project shows

- Repeatable EC2 provisioning with Terraform instead of four manual launches
- A dedicated control node, so configuration management is not mixed into the application hosts
- An Ansible inventory and playbook written for Amazon Linux 2023 (`dnf`, not `apt`)
- SSH key handling: key created outside the Terraform file, copied to the control node, permissions set to `400`
- Proof that the play reached all three hosts and that NGINX was active

## Architecture

```text
Windows workstation
  terraform apply
  scp of the private key
        |
        v
AnsibleControl (t3.micro, Amazon Linux 2023)
  ansible-core 2.15.3
  inventory.ini
  playbook.yml
  ansible-lab-key.pem (mode 400)
        |
        | SSH as ec2-user
        v
WebServer1   WebServer2   WebServer3
  NGINX        NGINX        NGINX
  port 80      port 80      port 80
```

Region: `us-east-1` (N. Virginia). Instance type: `t3.micro`. All four instances used the key pair `ansible-lab-key` and a security group that allowed SSH (22) and HTTP (80).

## Repository layout

```text
terraform/          EC2, security group, AMI lookup, outputs
ansible/            inventory example, playbook, ansible.cfg
docs/runbook.md     order of operations and the checks used
.gitignore          keys, state, and local variable files stay out of git
```

## What I did

- Confirmed the AWS CLI identity with `aws sts get-caller-identity` before any apply. The first plan failed with `InvalidClientTokenId` because the saved access key was stale. After the key was replaced, the caller was the IAM user `terraform-admin`.
- Created the key pair `ansible-lab-key` and saved the private material to `ansible-lab-key.pem` (1,702 bytes, ASCII). The `.pem` file is not in this repository.
- Wrote Terraform for three web servers (Amazon Linux 2023, `t3.micro`, Name tags `WebServer1`, `WebServer2`, `WebServer3`).
- The lab sample used `t2.micro`. This account rejected it as not eligible for the Free Tier. All instance types were changed to `t3.micro`. The role of each host did not change.
- Applied the three web servers: `Apply complete! Resources: 3 added, 0 changed, 0 destroyed`.
- Added `AnsibleControl` in the same file and applied it: `Resources: 1 added`.
- SSH'd to the control node as `ec2-user`, installed `nano` and `ansible-core`, and confirmed `ansible [core 2.15.3]`.
- Wrote `inventory.ini` with the public IPv4 addresses, not the private `172.31` addresses.
- Rewrote the playbook for Amazon Linux. The sample used `apt`. These hosts use `dnf`, and the service name is `nginx`.
- Copied the private key to the control node with `scp` from a second PowerShell terminal, then set `chmod 400`. SSH refuses a private key that other users can read.
- Ran the playbook. The recap for all three addresses was `failed=0` and `unreachable=0`. `changed=2` on each host matched the install and the service start.
- Verified NGINX on WebServer1 with `systemctl status nginx`. The service was `active (running)`.
- Stopped the instances after the proof was saved so compute charges would stop.

Public addresses from that run, recorded before the instances were stopped:

| Name | Public IPv4 |
| --- | --- |
| WebServer1 | 3.88.117.181 |
| WebServer2 | 18.208.230.11 |
| WebServer3 | 13.217.105.201 |
| AnsibleControl | 100.30.193.37 |

Those addresses were valid for that run only. A stop and start assigns a new public IP unless an Elastic IP is attached. The inventory in this repo uses placeholders for that reason.

## Run it

Prerequisites: Terraform, AWS CLI credentials with permission to create EC2 resources, and an existing key pair named `ansible-lab-key` in `us-east-1` (or change `key_name` in `terraform/terraform.tfvars`).

```bash
cd terraform
cp terraform.tfvars.example terraform.tfvars
terraform init
terraform plan
terraform apply
```

Copy the public IPs from the outputs into `ansible/inventory.ini`. Do not commit that file if it contains live addresses you do not want published. SSH to the control node, copy the key, lock it down, then run the playbook:

```bash
chmod 400 ansible-lab-key.pem
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook \
  -i inventory.ini playbook.yml \
  -u ec2-user --private-key ansible-lab-key.pem
```

Tear down when the proof is done:

```bash
terraform destroy
```

Proof screenshots are in `docs/screenshots`. Account numbers and the IAM ARN are covered. Access key values were already masked in the originals. The Windows path shows `USER` as a placeholder. No `.pem` files or Terraform state are included.

- No access keys, `.pem` files, or Terraform state are committed.
- SSH inbound should be limited to an operator IP. The example security group uses a variable for that, defaulting to a placeholder that must be replaced before apply.
- The control node is the only host that needs the private key and Ansible.
- Instances were stopped after verification. Terminate them when the project no longer needs the disks.

## Skills used

AWS EC2, security groups, key pairs, Amazon Linux 2023, Terraform, Ansible, NGINX, SSH, SCP, IAM user credentials for the AWS CLI.
