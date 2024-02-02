# 9. Create Ubuntu server and install/enable appache2
resource "aws_instance" "web-server" {
  ami               = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type     = "t2.micro"
  availability_zone = "us-east-1a"
  key_name          = "global_ec2_access_key"

  network_interface {
    device_index         = 0
    network_interface_id = aws_network_interface.web-server-nic.id
  }

  user_data = file("${path.module}/scripts/install_apache2.sh")

  tags = {
    Name = "Web server"
  }
}
