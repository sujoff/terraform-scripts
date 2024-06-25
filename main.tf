# Welcome to my VPC created using Terraform
# This is my first VPC and It'll surely be working fine
# Here we go.
# Here we go.
# Here we go.
# Here we go.

#Step 1: Create VPC
resource "aws_vpc" "tfvpc"{
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "MyTerraformVPC"
    }
}

#Step 2: Create Public Subnet
resource "aws_subnet" "PublicSubnet"{
    vpc_id = aws_vpc.tfvpc.id
    cidr_block = "10.0.1.0/16"
    }


#Step 3: Create Private Subnet

resource "aws_subnet" "PrivateSubnet"{
    vpc_id = aws_vpc.tfvpc.id
    cidr_block = "10.0.2.0/16"
    }

#Step 4: Create Internet Gateway(IGW)

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.tfvpc.id
    
}

#Step 5: Create Route Table for Public Subnet
resource "aws_route_table" "PublicRT" {
    vpc_id = aws_vpc.tfvpc.id
    route {
        cidr_block = ".0.0.0.0/0"
        gateway_id = "aws_internet_gateway.igw"
    }
}

#Step5: Associate Route table to Public Subnet
resource "aws_route_table_association" "PublicRTA" {
  subnet_id = aws_route_table.PublicRT.id
  route_table_id = aws_route_table.PublicRT.id
}