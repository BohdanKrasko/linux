variable "ami_name" {
	default = "AMI_NAME"
}

variable "ami_id" {
	#default = "ami-0be9fcdb56a1f1226"
	default = "ami-09558250a3419e7d0" #amazon linux
}

variable "ami_key_pair_name" {
	default = "./key.pub"
}
