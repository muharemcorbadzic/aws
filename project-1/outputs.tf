output "web_server_private_ip" {
  value       = aws_instance.web-server.private_ip
  description = "Web server private IP"
}

output "web_server_id" {
  value       = aws_instance.web-server.id
  description = "Web server instance ID"
}
