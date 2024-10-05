# output "instance_public_ip" {
#   description = "The public IP of the created EC2 instance."
#   value       = aws_instance.first-ec2.public_ip
# }

output "vpc_id" {
  value = aws_vpc.vpc-01.id
}

output "subnet_id" {
  value = data.aws_subnet.subnet-01.id
}