#!/bin/sh

mkdir binaries
cd binaries

apt-get update -y && \
    apt-get install -y tzdata && \
    apt-get upgrade -y

# Install Helm
curl -L -o helm.tar.gz https://get.helm.sh/helm-v3.14.0-linux-amd64.tar.gz
tar -zxvf helm.tar.gz
mv linux-amd64/helm /usr/local/bin

# Install Terraform
curl -L -o terraform.zip https://releases.hashicorp.com/terraform/1.7.0/terraform_1.7.0_linux_386.zip
unzip terraform.zip
mv ./terraform /usr/local/bin
chmod +x /usr/local/bin/terraform

#Install medusa
curl -L -o medusa https://github.com/jonasvinther/medusa/releases/download/v0.7.2/medusa_0.7.2_linux_amd64.tar.gz
tar -xvf medusa
mv medusa /usr/local/bin/medusa

apt-get clean && \
rm -rf /var/lib/apt/lists/*

cd ../binaries
rm -rf binaries