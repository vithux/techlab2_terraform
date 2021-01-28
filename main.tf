provider "aws" {
        region = "us-east-2"
        profile = "user_aws"
}

resource "aws_dynamodb_table" "origem_techlab2" {
        name           = "vmarques_origem_techlab2"
        billing_mode   = "PROVISIONED"
        read_capacity  = 1
        write_capacity = 1
        hash_key       = "UserId"
        range_key      = "GameTitle"

        attribute {
            name = "UserId"
            type = "S"
        }

        attribute {
            name = "GameTitle"
            type = "S"
        }
}

resource "aws_dynamodb_table" "destino_techlab2" {
        name           = "vmarques_destino_techlab2"
        billing_mode   = "PROVISIONED"
        read_capacity  = 1
        write_capacity = 1
        hash_key       = "UserId"
        range_key      = "GameTitle"

        attribute {
            name = "UserId"
            type = "S"
        }

        attribute {
            name = "GameTitle"
            type = "S"
        }
}


resource "aws_instance" "application_ec2" {
    ami = "ami-0a0ad6b70e61be944"
    instance_type = "t2.micro"
    key_name = "terraform-key"
    security_groups = [ "allow-cit" ]
    tags = {
      "Name" = "vmarques_terraform_techlab2"
    }
}
