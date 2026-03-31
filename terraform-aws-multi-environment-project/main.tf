locals  {
    dev = {
        instance_count = 2
    }

     stg = {
        instance_count = 3
    }

     prd = {
        instance_count = 4
    }
}

module "dev-infra" {
  source = "./modules/ec2"
  env = terraform.workspace
  
}