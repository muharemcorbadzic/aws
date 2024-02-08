data "cloudinit_config" "execute-scripts" {
  gzip          = false
  base64_encode = false

  part {
    filename     = "install-apache2.sh"
    content_type = "text/x-shellscript"

    content = file("${path.module}/scripts/install-apache2.sh")
  }

  part {
    filename     = "volume.sh"
    content_type = "text/x-shellscript"

    content = templatefile("${path.module}/scripts/volume.sh", {
      DEVICE = var.VOL_1_DEVICE_NAME
    })
  }
}
