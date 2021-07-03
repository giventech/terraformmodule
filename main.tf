
module "aws_ec2_scale" {
  source = "./modules/aws_ec2_scale"
  cluster_name ="fabcluster"
  adm_user = "admzjl2"
  vpc_id = "vpc-a91908ce"
  ami = "ami-05064bb33b40c33a2"
  subnet_ids = ["subnet-b2b1d9ea", "subnet-ab4fa4e3"] # ALB requires minimum 2 subnets in two availability zones
  instance_type = "t3.micro"
  key_name = var.key_name
  tags = var.tags
  min_size = 1
  max_size = 2
  desired_capacity = 3

}

provider "aws" {
  profile = "default"
  region  = "ap-southeast-2"
}
# provider "aws" {
#   region                      = "us-west-2"
#   s3_force_path_style         = true
#   skip_credentials_validation = true
#   skip_metadata_api_check     = true
#   skip_requesting_account_id  = true

#   endpoints {
#     apigateway     = "http://localhost:4567"
#     cloudformation = "http://localhost:4581"
#     cloudwatch     = "http://localhost:4582"
#     dynamodb       = "http://localhost:4569"
#     es             = "http://localhost:4578"
#     firehose       = "http://localhost:4573"
#     iam            = "http://localhost:4593"
#     kinesis        = "http://localhost:4568"
#     lambda         = "http://localhost:4574"
#     route53        = "http://localhost:4580"
#     redshift       = "http://LOCALHOST:4577"
#     s3             = "http://localhost:4572"
#     secretsmanager = "http://localhost:4584"
#     ses            = "http://localhost:4579"
#     sns            = "http://localhost:4575"
#     sqs            = "http://localhost:4576"
#     ssm            = "http://localhost:4583"
#     stepfunctions  = "http://localhost:4585"
#     sts            = "http://localhost:4592"
#     ec2            = "http://localhost:4597"

#   }
# }