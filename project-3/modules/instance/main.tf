resource "aws_instance" "server" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [var.security_group_id]
  subnet_id              = var.subnet_id
  associate_public_ip_address = true  # This enables public IP and DNS

  connection {
    type        = "ssh"
    user        = "ubuntu"  
    private_key = file(var.private_key_path)
    host        = self.public_ip
  }

    # File provisioner to copy a file from local to the remote EC2 instance
  provisioner "file" {
    source      = "code.py"  
    destination = "/home/ubuntu/code.py" 
  }  

  provisioner "remote-exec" {
    inline = [
      "echo 'Hello from the remote instance'",
      "sudo apt update -y",  # Update package lists (for ubuntu)
      "sudo apt install -y python3-flask",  # Example package installation
      "cd /home/ubuntu",
      "sudo pip3 install flask",
      "sudo python3 code.py",
    ]
  }
}