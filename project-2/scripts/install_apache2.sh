#!/bin/bash
sudo apt update -y
sudo apt install apache2 -y
sudo systemctl start apache2
sudo bash -c 'echo "<h1>Web server is up and running</h1><hr><h3>This is so awesome!!!!</h3>" > /var/www/html/index.html'