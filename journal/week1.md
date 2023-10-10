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

## Usig Terraform Refresh

[Terraform Refresh](https://developer.hashicorp.com/terraform/cli/commands/refresh)

### Fix Missing Resources with Terraform Import

`terraform import aws_s3_bucket.example`

[Terraform Import](https://developer.hashicorp.com/terraform/tutorials/state/state-import?utm_source=WEBSITE&utm_medium=WEB_IO&utm_offer=ARTICLE_PAGE&utm_content=DOCS)


### Fix Manual Configuration

If someone deletes or modifies cloud resources manually via Clickops. 

We can run Terraform plan to put our infrastructure back into the expected state fixing the *Configuration Drift*

## Terraform Modules

### Terraform Module Structure 

It is recommended to place modules in a `modules` directory when locally developing modules but you can name it whatever you like. 

## Passing Input Variables

We can pass input variables to our module

the module has to declare these TF variables in its own variables.tf

```tf
module "terrahous_aws"{
  source = "./modules/terrahouse_aws"
  user)uuid= var.user_uuid 
  bucket_name = var.bucket)name
}
```

## Module Sources

Using the source we can import the module from various places eg:

- locally
- Github
- Terraform Registry

```tf
module "terrahous_aws"{
  source = "./modules/terrahouse_aws"
}
```
[Module Sources](https://developer.hashicorp.com/terraform/language/modules/sources) 


[Module Sources](https://developer.hashicorp.com/terraform/language/modules/sources) 


## Chat GPT considerations with TF langauge

LLMs such as CHatGPT may not have information on the latest documentation or information about terraform

it may likely produce older examples of code.

## Working with files in TF

## File exist function

this function checks the existence of a file
```
condition = fileexists(var.index_html_filepath)
```
## File MD5

https://developer.hashicorp.com/terraform/language/functions/file

In terraform there is a soecial variable called `path` that allows us to reference local paths:
- path.module = get the path for the current module
- path.root = get the path for the root module

[Special Path Var](https://developer.hashicorp.com/terraform/language/expressions/references)


resource "aws_s3_bucket_object" "error_html" {
  bucket = aws_s3_bucket.website_bucket.bucket
  key    = "error.html"
  source = var.error_html_filepath

   etag = filemd5(var.error_html_filepath)
}

