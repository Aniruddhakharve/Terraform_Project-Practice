locals  {
    env = {
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

current = lookup(local.env, terraform.workspace, local.env["dev"])
}


module "ec2" {
  source = "./modules/ec2"
  env = terraform.workspace
  ec2_instance_count = local.current.instance_count
  
}