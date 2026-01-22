# Outputs
output "ansible_node_ip" {
  value = aws_instance.ansible.public_ip
}

output "java_node_ip" {
  value = aws_instance.java.public_ip
}

output "nginx_node_ip" {
  value = aws_instance.nginx.public_ip
}
