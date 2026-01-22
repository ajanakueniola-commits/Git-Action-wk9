output "ansible_public_ip" {
  value = aws_instance.ansible.public_ip
}
output "java_public_ip" {
  value = aws_instance.java.public_ip
}
output "nginx_public_ip" {
  value = aws_instance.nginx.public_ip
}
output "security_group_id" {
  value = aws_security_group.allow_ssh_http.id
}