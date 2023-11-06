output "ami_id" {
  description = "EC AMI id"
  value       = aws_instance.basic-instance.ami

}

output "arn" {
  description = "EC2 ARN"
  value       = data.aws_ami.amazon_linux.arn

}

output "public_ip" {
    description = "EC2 Public IP"
    value = aws_instance.basic-instance.public_ip  
}
