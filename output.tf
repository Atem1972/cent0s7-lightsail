output "public_key" {
  value = aws_lightsail_instance.web-server.public_ip_address  #recall from ligtsail resource block
}
output "username" {
    value = aws_lightsail_instance.web-server.username   #recall from ligtsail resource block
  
}
output "ssh_command" {
value = "ssh -1 ${local_file.ssh_key.filename} ${aws_lightsail_instance.web-server.username}@${aws_lightsail_instance.web-server.public_ip_address}"
                 #recall from keypair save file. # recall from output username value.        #recall from output public key value
}