# Runbook

Order used for the working run. Commands assume the workstation folder holds the Terraform files and `ansible-lab-key.pem`.

## 1. Confirm the AWS identity

```bash
aws sts get-caller-identity
```

A good response includes the account and the IAM user. `InvalidClientTokenId` means the access key on the computer is old or wrong. Fix the shared credentials file, then run the command again before `terraform apply`.

## 2. Key pair

```bash
aws ec2 describe-key-pairs --query "KeyPairs[].KeyName" --output text
aws ec2 create-key-pair --key-name ansible-lab-key --query "KeyMaterial" --output text | Set-Content -Path ansible-lab-key.pem -Encoding ascii
```

The pipe matters. `KeyMaterial` is the private key text. `Set-Content -Encoding ascii` keeps the format SSH expects. On macOS or Linux, use `tee` instead of `Set-Content`.

## 3. Build the fleet

```bash
terraform init
terraform plan
terraform apply
```

The first apply in the working run added the three web servers. The control node was added in a second apply so the manager was not mixed into the first web-server change. One apply of this repository creates all four.

If AWS returns `InvalidParameterCombination` and says the type is not eligible for the Free Tier, keep `t3.micro`.

## 4. Control node

```bash
ssh -i ansible-lab-key.pem ec2-user@<control-public-ip>
sudo dnf install -y nano ansible-core
ansible --version
```

`ansible --version` only works after the prompt has changed to the Linux host. The working run reported `ansible [core 2.15.3]`.

## 5. Inventory and playbook

Write `inventory.ini` with the three public IPs under `[webservers]`. Copy `playbook.yml` to the control node. The playbook uses `dnf` because these instances are Amazon Linux 2023. An `apt` playbook fails here because `apt` is not installed.

## 6. Key on the control node

From a second workstation terminal, not from inside the SSH session:

```bash
scp -i ansible-lab-key.pem ansible-lab-key.pem ec2-user@<control-public-ip>:/home/ec2-user/ansible-lab-key.pem
```

Back on the control node:

```bash
chmod 400 ansible-lab-key.pem
ls -l ansible-lab-key.pem
```

Expected mode: `-r--------`.

## 7. Run and prove

```bash
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i inventory.ini playbook.yml -u ec2-user --private-key ansible-lab-key.pem
ssh -i ansible-lab-key.pem -o StrictHostKeyChecking=no ec2-user@<webserver1-public-ip> "systemctl status nginx"
```

Pass condition: play recap `failed=0` and `unreachable=0` on every host, and `Active: active (running)` for NGINX.

## 8. Stop or destroy

Stop is enough to end compute charges for the night. The EBS volume can still bill until the instance is terminated. `terraform destroy` removes the instances and the security group created by this project.

## Failure map

| Symptom | Cause |
| --- | --- |
| `InvalidClientTokenId` | Stale AWS access key on the workstation |
| Free Tier instance type rejected | `t2.micro` not eligible; use `t3.micro` |
| Ansible `unreachable` | Inventory has a private IP, or port 22 is closed |
| `apt` task fails | Playbook written for Ubuntu on an Amazon Linux host |
| SSH refuses the key | Private key mode is not `400` |
| Login never starts | Security group does not allow port 22 from the operator IP |
