resource "aws_launch_configuration" "user*-asg-launch" {
  name_prefix = "user*-autoscaling-web-"

  image_id = var.amazon_linux
  instance_type = "t3.nano"
  key_name = var.user*_keyname
  security_groups = [
    aws_security_group.user*-sg.id,
    aws_default_security_group.user*-default-sg.id,
  ]
  associate_public_ip_address = true
    
user_data = <<USER_DATA
#!/bin/bash
yum update
yum -y install httpd
echo "<html>" > /var/www/html/index.html
echo "Hello" >> /var/www/html/index.html
echo "<p> SERVER IP: $(curl http://169.254.169.254/latest/meta-data/local-ipv4) </p>" >> /var/www/html/index.html
echo "<img src=\"CloudFront URL\">" >> /var/www/html/index.html
echo "</html>" >> /var/www/html/index.html

systemctl start httpd.service
systemctl enable httpd.service

  USER_DATA

  lifecycle {
    create_before_destroy = true
  }
}
