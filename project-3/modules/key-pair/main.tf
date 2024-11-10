resource "aws_key_pair" "terraform" {
  key_name   = "terraform-practice-supriya"
  public_key = var.public_key
}


