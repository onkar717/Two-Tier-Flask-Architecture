output "ec2_public_ip" {
  value       = aws_instance.flask_app.public_ip
  description = "Public IP of the EC2 instance running Flask app"
}

output "ec2_instance_id" {
  value       = aws_instance.flask_app.id
  description = "EC2 instance ID"
}
