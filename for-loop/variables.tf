variable "instances" {
    default = [ "mongodb","redis","mysql","rabbitmq" ]
    # default   = {
    #     mongodb = "t3.micro"
    #     redis   = "t3.micro"
    #     mysql   = "t3.small"
    # }
}

variable "zone_id" {
    default = "Z10084241A7O0LJXGH49U"
}

variable "domain_name" {
    default = "deepthi.cloud"
}