output "instance_id" {
  description = "ID of the instance created by the module"
  value       = module.ec2.instance_id
}

output "bucket_name" {
  description = "Name of the lab bucket"
  value       = aws_s3_bucket.lab.id
}
