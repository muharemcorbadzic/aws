# Create EC2 instance
resource "aws_instance" "web-server" {
  ami           = lookup(var.AMIS, var.AWS_REGION)
  instance_type = "t2.micro"

  subnet_id                   = aws_subnet.my_test_subnet.id
  vpc_security_group_ids      = [aws_security_group.allow_web.id]
  associate_public_ip_address = true

  user_data = file("${path.module}/scripts/install_apache2.sh")
  key_name  = "global_ec2_access_key"

  tags = {
    Name = "Web server"
  }
}
