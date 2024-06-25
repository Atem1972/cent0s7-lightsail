#generate secure private key and encode it with pem
resource "tls_private_key" "vampy" {
    algorithm = "RSA"
    rsa_bits = 2048

  
}
# create key pair
resource "aws_lightsail_key_pair" "vampy" {
    name = "wisiy"
    public_key = tls_private_key.vampy.public_key_openssh
  
}

#save file
resource "local_file" "ssh_key" {
    filename = "wisiy.pem"
    content = tls_private_key.vampy.private_key_pem
  
}
#lightsail server centos7
resource "aws_lightsail_instance" "web-server" {
    name = "lamp-server"
    blueprint_id = "centos_7_2009_01"
  bundle_id = "medium_1_0"
  availability_zone = "us-east-1a"
}