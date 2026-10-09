## Project 5

### [Ansible NGINX Web Fleet](https://github.com/Gus-Del/ansible-nginx-web-fleet)

In this project, I:

- Provisioned three Amazon Linux 2023 web servers and a separate Ansible control node in us-east-1 with Terraform.
- Replaced t2.micro with t3.micro after the account rejected the Free Tier instance type, then applied the fleet.
- Installed ansible-core 2.15.3 on the control node and wrote an inventory of the web servers' public IPs.
- Rewrote the NGINX playbook for dnf, because the sample apt tasks do not run on Amazon Linux 2023.
- Copied the lab key to the control node, locked it to mode 400, and ran the playbook with failed=0 on all three hosts.
- Confirmed NGINX was active (running), then stopped the instances. No keys or Terraform state are committed.
