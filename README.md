# terraform-training

See https://pages.github.boschdevcloud.com/GS-PJ-TOP98-AI-KNOW/terraform-beginner-workshop/

# Preparaion 

- login to the AWS account (platform) https://myapplications.microsoft.com/
- Start your cloud9 IDE, check AWS auth. settings 
- clone the training repo
git clone https://github.com/frank-bee/terraform-training.git

# Lab 1

## Get started
- go to the root of the training repo, where you find the `main.tf`
- Run `terraform init`
  Observe the output
- Run `terraform plan`
  Observe the output

## Variable usage
- Try several ways of [setting the root variables](https://www.terraform.io/docs/language/values/variables.html#assigning-values-to-root-module-variables)
- Use a variable to set the attribute `subnet_id`
- Introduce a variable `prefix` and use it to prefix the ec2 tag "Name" (with e.g. your name)

## Format you code 
- Run `terraform fmt`

# Lab 2

# Lab 3