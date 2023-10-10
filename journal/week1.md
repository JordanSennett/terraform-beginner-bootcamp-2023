# Terraform Beginner Bootcamp 2023 - Week 1

## Root Module Structure

Our root mdule structure is as follows:
```
PROJECT_ROOT
├
├── variables.tf      #stores the structure of input variables
├── main.tf           #everything else
├── providers.tf      #defined required providers and their configuration
├── outputs.tf        #stores our outputs
├── terraform.tfvars  #The data of variables we want to load into our terraform project
└── README.md         #required for root modules
```

[Standard Module Structure](https://developer.hashicorp.com/terraform/language/modules/develop/structure)

## Terraform and Input Variables


## Terraform Cloud Variables 

In terraform we can set two kind of variables:
- Enviroment Variables - those you would set in your bash terminal eg. AWS credentials
- Terraform Variables - those that you would normally set in you tfvars file

We can set Terraform Cloud Variables to be sensitive so that they are not shown visibly in the console.

## Loading Terraform Variables

[Loading TF Variables](https://developer.hashicorp.com/terraform/language/modules/develop/structure)

We can use the `-var` flag to set an input variable or override a variable in the tfvars file eg `terraform -var user_uuid="my-user_id"`

### var-file flag

- TODO: research this flag

### terraform.tfvars

This is the default file to load in terraform variables in bulk.

### auto.tfvars

-TODO: Research this functionality for terraform cloud

### order of terraform variables

-TODO: Research this 

##Terraform Import

## Dealing with Configuration Drift

## Losing State file

If you lose your staefile you will have to tear down all of your cloud infrastructure manually and then re-import it.

### Fix Missing Resources with Terraform Import

`terraform import aws_s3_bucket.example`

[Terraform Import](https://developer.hashicorp.com/terraform/tutorials/state/state-import?utm_source=WEBSITE&utm_medium=WEB_IO&utm_offer=ARTICLE_PAGE&utm_content=DOCS)


### Fix Manual Configuration

If someone deletes or modifies cloud resources manually via Clickops. 

We can run Terraform plan to put our infrastructure back into the expected state fixing the *Configuration Drift*