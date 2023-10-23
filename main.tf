resource "aws_security_group" "FESG" {
    name = "fesgtf"

    ingress{
        cidr_blocks = [ "0.0.0.0/0" ]
        description = "allow ssh"
        from_port = 22
        to_port = 22
        protocol = "tcp"
    }

    ingress {
        cidr_blocks = [ "0.0.0.0/0" ]
        description = "allow http"
        from_port = 0
        to_port = 80
        protocol = "tcp"
    }

    egress{
        cidr_blocks = [ "0.0.0.0/0" ]
        description = "permit all"
        from_port = 0
        to_port = 0
        protocol = "-1"
    }
}

resource "aws_instance" "wordpressfrontend" {
    ami = "ami-0679acc8a14eb3edc" # amazon linux 2023 ARM
    instance_type = "t3.micro"
    key_name = "shellws"
    security_groups = [ "fesgtf" ]
    tags = {
        app = "wordpress"
        role = "frontend"
    }
}

resource "aws_eip" "wpip" {
    instance = aws_instance.wordpressfrontend.id
    # vpc = true

    tags = {
        app = "wordpress"
    }
}