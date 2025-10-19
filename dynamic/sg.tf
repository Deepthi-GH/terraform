# block
resource "aws_security_group" "roboshop_instance" {
    name =            "roboshop-strict-sg"
    description =     "Security group allowing all inbound and outbound traffic"
    egress{
        from_port = 0
        to_port   = 0
        protocol  = "-1"
        cidr_blocks = ["0.0.0.0/0"]

    }
    # block
    dynamic "ingress" {
        for_each = toset(var.ingress_ports) # works without to set also. but to bring unqiness and avoid duplicates.
        content {
            from_port = ingress.value #here ingress is special keyword
            to_port   = ingress.value
            protocol  = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        }
    }

    tags = {
        Name = "roboshop-strict-sg"

    }
}

