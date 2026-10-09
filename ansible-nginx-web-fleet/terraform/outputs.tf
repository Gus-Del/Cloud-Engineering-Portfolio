output "web_public_ips" {
  description = "Paste these into ansible/inventory.ini under [webservers]. Use the public addresses, not the 172.31 private addresses."
  value       = { for name, inst in aws_instance.web : name => inst.public_ip }
}

output "control_public_ip" {
  description = "SSH target for the Ansible control node."
  value       = aws_instance.control.public_ip
}

output "ami_id" {
  value = data.aws_ami.amazon_linux_2023.id
}
