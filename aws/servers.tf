resource "aws_key_pair" "test-ec2-instance" {
  key_name   = "ubuntu"
  public_key = file("key.pub")
  #~/.ssh/key you shoud save ssh key in this folder
}

resource "aws_instance" "test-ec2-instance" {
  ami = "${var.ami_id}"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.test-ec2-instance.key_name
  security_groups = ["${aws_security_group.ingress-all-test.id}"]
  
  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("key")
    host        = self.public_ip
  }
  tags = {
    Name = "${var.ami_name}"
  }
  subnet_id = "${aws_subnet.subnet-uno.id}"
}
