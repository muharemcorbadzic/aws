# Simple AWS Infrastructure

In this project we will setup simple AWS infrastructure with following sections:

1. Create VPC
2. Create Internet Gateway
3. Create Custom Route Table
4. Create Subnet
5. Associate subnet with Route Table
6. Create a network interface with an IP in the subnet that was created in step 4
7. Create Security Group to allow port 22, 80, 443
8. Assign an elastic IP to the network interface created in step 7
9. Create Ubuntu server and install/enable appache2