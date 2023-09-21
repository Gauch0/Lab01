resource "aws_instance" "OpenVPN" {
  ami                             = var.instance_ami
  instance_type                   = var.instance_type
  subnet_id                       = var.subnet_id
  user_data                       = file("${path.module}/user-data.sh")
  associate_public_ip_address     = true

  tags = merge(local.common_tags,{ Name = "${var.environment}-OpenVPN"})

}