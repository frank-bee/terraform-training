# terraform-training Lab

Training slides see https://pages.github.boschdevcloud.com/GS-PJ-TOP98-AI-KNOW/terraform-beginner-workshop/

# Preparation 

- login to the AWS account (platform) https://myapplications.microsoft.com/
- Start your cloud9 IDE, check AWS auth. settings 
- clone the training repo\
git clone https://github.com/frank-bee/terraform-training.git

# Lab 1

## 1.1 Get started
- go to the root of the training repo, where you find the `main.tf`
- Run `terraform init`\
  Observe the output
- Run `terraform plan`\
  Observe the output

## 1.2 Variable usage
- Try several ways of [setting the root variables](https://www.terraform.io/docs/language/values/variables.html#assigning-values-to-root-module-variables)
- Use a variable to set the attribute `subnet_id`
- Introduce a variable `prefix` and use it to prefix the ec2 tag "Name" (with e.g. your name)

## 1.3 Format you code 
- Run `terraform fmt`

## (optional) 1.4
- Find out about the EC2 / instance attribute which is resposible to enable monitoring of the EC2 (google)
- Enable monitoring and observe the plan.

# Lab 2

## 2.1 Apply, Change, Apply
- Apply the infrastructure with a `terraform apply`
- Check in the AWS console the result 
- Change something in the code, e.g. enabling /disabling ec2 monitoring (attribute `monitoring`)\
What do you expect running `terraform plan`? Do it
- Apply the changes with a `terraform apply --auto-approve`

## 2.2 Destroy the infrastructure
- Destroy the infrastructure with a `terraform destroy`
- What do you expect running `terraform plan`? Do it
- Recreate the infrastructure

## 2.3 Add an output
- Add a terraform output for the URL of your wordpress site to your stack (typically in a file `output.tf`)\
Hint: Make use of the attribute `public_dns` of the instance
- Apply the change
- Try the command `terraform output`
- Can you see the wordpress site in your browser? Quiz: why not?

## 2.4 Make use of a public module
- Create a SG with [this module](https://registry.terraform.io/modules/terraform-aws-modules/security-group/aws/3.0.1/submodules/https-443)\
Set the following attributes: name, description, vpc_id, cidr_blocks.\
Use the internet CIDR block `0.0.0.0/0` - or even better your own IP / Bosch IP range
- Reference a suitable attribute in your `aws_network_interface`:
```
resource "aws_network_interface" "wpress" {
  subnet_id   = "subnet-0f59ce43a926f6179"

  security_groups = ...
```
- Apply the changes to your stack
- Does your wordpress appear in the browser now?
 
## 2.5 (optional) Make use of a data source
- Refactor the "hardcoded" subnet_id
- Use https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet \
Hint: Filter

# Lab 3
- Create a branch in in our [infrastrastructure repo](https://github.boschdevcloud.com/GS-PJ-TOP98-AI-KNOW/infrastructure)
- Instantiate the [terraform-aws-dummy module](https://github.boschdevcloud.com/GS-PJ-TOP98-AI-KNOW/terraform-aws-dummy) in the [platform dev stack](https://github.boschdevcloud.com/GS-PJ-TOP98-AI-KNOW/infrastructure/blob/master/workstreams/platform/dev/main.tf) \
Hint: See how to reference the latest module version [here](https://www.terraform.io/docs/language/modules/sources.html#selecting-a-revision)
- Open a pull request and observe the terraform plan
- Add Frank as reviewer
