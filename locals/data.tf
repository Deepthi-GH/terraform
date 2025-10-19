data "aws_ami" "joindevops" {
    owners         = ["973714476881"] 
    most_recent    = true

    filter {
        name  = "name"
        values = ["RHEL-9-DevOps-Practice"]
    }

    filter {
        name  = "root-device-type"
        values = ["ebs"]
    }

    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }

}

output "ami_id_output" {
    value = data.aws_ami.joindevops.id
}

# data "aws_instance" "mongodb" {
#     instance_id = "i-0d7a9ddfeeb34853d"
# }

# output "mongodbinfo" {
#     value = data.aws_instance.mongodb.public_ip
# }