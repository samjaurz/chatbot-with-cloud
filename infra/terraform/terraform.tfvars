
region = "us-east-1"
vpc_name = "cb-vpc"
instance_name = "chatbot"
instance_type = "t3.micro"

ssh_key_name = "mcp-bot-key"
user_data = <<EOF
#!/bin/bash
yum update -y

# Base tools`
yum install -y git docker python3 python3-pip

# Docker
systemctl enable docker
systemctl start docker
usermod -aG docker ec2-user

# Python tooling
pip3 install --upgrade pip
pip3 install uv requests
EOF

############################################
# S3 Static Website
############################################
bucket_name = "demo-static-site-unique-123456"


#TODO : Add all the steps for running the ec2 instance with all the dependencies needed