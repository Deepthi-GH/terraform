resource "aws_instance" "ec2_instance" {
    # count            = 4
    count            =  length(var.instances)
    ami              = "ami-09c813fb71547fc4f"
    instance_type    = "t3.micro"
    vpc_security_group_ids = [aws_security_group.allow_all.id]
    tags = {
        Name      = var.instances[count.index] #count.index is 0 in first iteration
        Terraform = "true"
    }
}

resource "aws_security_group" "allow_all" {
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


