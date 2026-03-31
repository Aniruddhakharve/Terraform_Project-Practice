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


module "ec2" {
  source = "./modules/ec2"
  env = terraform.workspace
  ec2_instance_count = local.terraform.workspace.instance_count
  
}