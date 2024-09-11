### Terraform Example creating a resource in 2 different AWS regions reusing module

### Prerequisites

Requires terraform version 1.9.5 or higher.

HashiCorp Terraform Installation Instructions: 

https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli

Requires AWS CLI, AWS Account Access, Environmental Variables configured for AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY and AWS_DEFAULT_REGION

https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html

https://docs.aws.amazon.com/cli/v1/userguide/cli-configure-envvars.html

### Requirements

Requires **terraform.tfvars** file in module root directory with the following:

```bash
aws_region_1 = "us-east-2"
aws_region_2 = "us-west-2"

ami_id_east = "<AMI in east-2 region"
ami_id_west = "<AMI in west-2 region"

```

.gitignore file with:

```bash
# Local .terraform dir
.terraform/*

# terraform state files
*.tfstate
*.tfstate.*

# terraform variable files
*.tfvars
```

### Instructions

```bash
terraform init
terraform plan -var-file="terraform.tfvars"
terraform apply -var-file="terraform.tfvars"

```

### Terrafrom Expected Verbose Example
```
Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

module.ec2_instance_west.aws_instance.this: Creating...
module.ec2_instance_east.aws_instance.this: Creating...
module.ec2_instance_west.aws_instance.this: Still creating... [10s elapsed]
module.ec2_instance_east.aws_instance.this: Still creating... [10s elapsed]
module.ec2_instance_east.aws_instance.this: Creation complete after 13s [id=i-080483d02ac98a835]
module.ec2_instance_west.aws_instance.this: Still creating... [20s elapsed]
module.ec2_instance_west.aws_instance.this: Still creating... [30s elapsed]
module.ec2_instance_west.aws_instance.this: Creation complete after 32s [id=i-00c5bd3e11125087f]

Apply complete! Resources: 2 added, 0 changed, 0 destroyed.

Outputs:

east_instance_id = "i-080483d02ac98a835"
east_instance_public_ip = "3.145.137.107"
west_instance_id = "i-00c5bd3e11125087f"
west_instance_public_ip = "54.218.73.30"
```

### Post Cleanup
```bash
terraform destroy -var-file="terraform.tfvars"
```

### License

Copyright 2024 

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
