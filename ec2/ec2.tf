resource "aws_instance" "ec2_instance" {
    ami              = "ami-09c813fb71547fc4f"
    instance_type    = "t3.micro"
    tags = {
        Name = "Terraform"
        Terraform = "true"
    }
}

resource "aws_security_group" "sg_allow_all_traffic" {
    name =            "allow_all_traffic"
    description =     "Security group allowing all inbound and outbound traffic"
    egress{
        from_port = 0
        to_port   = 0
        protocol  = "-1"
        cidr_blocks = ["0.0.0.0/0"]

    }

    ingress{
        from_port = 0
        to_port   = 0
        protocol  = "-1"
        cidr_blocks = ["0.0.0.0/0"]

    }

    tags = {
        Name = "allow_all"

    }
}
