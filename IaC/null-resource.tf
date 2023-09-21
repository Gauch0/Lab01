locals {
  ssh_user = "ubuntu"
  vpn_user = "matias"
  pub_key_file = "~/.ssh/id_rsa.pub"
}

resource "null_resource" "pivpn_install" {
  depends_on = [module.dev-vpn]

  connection {
    type        = "ssh"
    user        = local.ssh_user
    private_key = file("vpn-key.pem")
    host        = module.dev-vpn.public_ip
  }

  provisioner "file" {
    source      = local.pub_key_file
    destination = "/home/${local.ssh_user}/.ssh/temp_key.pub"
  }

  provisioner "remote-exec" {
    inline = [
      "sleep 60",
      "sudo bash /tmp/pivpn/auto_install/install.sh --unattended /tmp/options.conf",
      "sleep 45",
      "sudo pivpn add --name ${local.vpn_user} nopass --days 1080",
      "sudo cat /home/${local.ssh_user}/.ssh/temp_key.pub >> /home/${local.ssh_user}/.ssh/authorized_keys",
      "sudo rm /home/${local.ssh_user}/.ssh/temp_key.pub",
      "sleep 45",
      "echo 'Generated VPN credentials'"
    ]
  }

  provisioner "local-exec" {
    command = "scp -i vpn-key.pem ubuntu@${module.dev-vpn.public_ip}:/home/ubuntu/ovpns/${local.vpn_user}.ovpn ~/Desktop/"
  }
}