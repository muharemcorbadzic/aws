#!/bin/bash
sudo apt update -y
sudo apt install apache2 -y
sudo systemctl start apache2
sudo bash -c 'echo "<h1>Server is running</h1>" > /var/www/html/index.html'