# Welcome to my VPC created using Terraform
# This is my first VPC and It'll surely be working fine
# Here we go.
# Here we go.
# Here we go.
# Here we go.
# Here we go.
# Here we go.
# Here we go.

#Step 1: Create VPC
resource "aws_vpc" "tfvpc"{
    cidr = "10.0.0.0/16"
    tag = {
        Name = "MyTerraformVPC"
    }
}

#Step 2: Create Public Subnet
resource "aws_subnet" "PublicSubenet"{
    vpc_id = aws_vpc.tfvpc.id
    cidr_block = "10.0.1.0/16"
    }


#Step 3: Create Private Subnet



#Step 4: Create Internet Gateway(IGW)



#Step 5: Create Eoute Table for Public Subnet