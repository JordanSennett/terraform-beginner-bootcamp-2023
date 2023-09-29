# Terraform Beginner Bootcamp 2023

## Semantic Versioning :mage:

This project is going to utilize semantic versioning for its tagging.
[semver.org](https://semver.org/)

The general format:

 **MAJOR.MINOR.PATCH**: eg. `1.0.1`

**MAJOR** version when you make incompatible API changes

**MINOR** version when you add functionality in a backward compatible manner

**PATCH** version when you make backward compatible bug fixes

## Install the Terraform CLI

### Considerations with the Terraform CLI Changes
The Terraform CLI installation instruction has changed due to gpg keyring changes. So we needed to refer to the latest install CLI instructions via Terraform Documentation and change the scripting for install.


[Installing the Terraform CLI](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

### Consoderationss for Linux Distubitions

This project is built against Ubunto. Please check your Linux distrubution and change accordingly to your distribution needs.

[How to check OS version in Linux](https://www.cyberciti.biz/faq/how-to-check-os-version-in-linux-command-line/)

Example of check OS version

```
$ cat /etc/os-release

PRETTY_NAME="Ubuntu 22.04.3 LTS"
NAME="Ubuntu"
VERSION_ID="22.04"
VERSION="22.04.3 LTS (Jammy Jellyfish)"
VERSION_CODENAME=jammy
ID=ubuntu
ID_LIKE=debian
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
```
### Refactoring into Bash scripts

While fixing the Terraform CLI gpg deprecation issues we notice that bacsh scripts steps were a considerable amount more code. So we decided to create a bash script to install the Terraform CLI.

This bash script is located here: [./bin/install_terraform_cli](./bin/install_terraform_cli)

- This will keep the GITPOD task file ([.gitpod.yml](.gitpod.yml)) neat
- This will allow us an easier way to debug and exexute manually terraform CLI install
- This will allow better pertability for other projects that need to install Terraform CLI


 #### Shebang

 A Shebang (pronounced Sha-bang) tells the bash script what program that will interpret the script. `#!/bin/bash`

 ChaptGPT recommended we use this format for bash: `#!/usr/bin/env bash` 

 - for portability
 - will search the users PATH for the bash executables 

 [](https://en.wikipedia.org/wiki/Shebang_(Unix))

#### Execution Considerations

 when executing the bash script we can use the `./` shorthand notation to execute the bash script.

eg. `./bin/install_terraform_cli`

If we are using a script in .gitpod.yml we need to point the script t a program to interpret it.

eg. `source ./bin/install_terraform_cli`

 ### Linux Permissions Considerations 

In order to make our bash scripts executable we need to change linus permission for the fix to be executable at the user mode

```sh
chmod u+x ./bin/install_terraform_cli
```
```sh
chmod 744 ./bin/install_terraform_cli
```

https://en.wikipedia.org/wiki/Chmod



### Github Lifecylcle (Before, Init, Command)

Need to be carefule when using the Init because it will not rerun if we restart an existing workspace.

https://www.gitpod.io/docs/configure/workspaces/tasks

### Working with Env Vars

We can list out all enviroment variables (Env Vars) using the `env` command

We can fitler specifv env vars using grep eg. `env | grep AWS_`

#### Setting and Unsetting ENV Vars

In the terminal we can set using `export HELLO='world`

In the terminal we can unset using `unset HELLO`

We can set an env var temporarilily when just running a command

```sh

Hello='world' ./bin/print_message
```

Within a bash we can set an env var without writing export eg.

```sh
#!/usr/bin/env bash

Hello=`world`

echo $Helllo
```

## Printing Env Vars

We can print an Env Vars using echo eg.    `echo $Hello`

#### Scoping of Env Vars

When you open up new Bash terminals in VS code it will not be aware of Env Vars that you have set in other windows.

If you want your Env Vars to persist across all future bash terminals that are open you need to set env vars in your bash profile. eg. `.bash_profile`

#### Persisting ENv Vars in Gitpod

We can persist env vars into gitpod by storing them in Gitpod Secrets Storage.

```
gp env HELLO=`world`
```
All future workspaces launched will set the env vars for all bash terminals opened in those workspaces.

You can also set en vars in the `.gitpod.yml` but this can only contain non sensitive env vars


### AWS CLI is installation

AWS CLI is installed for the project via the bash script ['./bin/install_aws_clI'](./bin/install_aws_cli)

[Getting Started with installing AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
[AWS CLI Env Vars](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html)


We can check if our AWS credentials is configured correctly by running the following AWS CLI command:

```sh
aws sts get-caller-identity

```

If it is successful you should see json the looks likes this 

```
{
 "UserId": "AIDA3NPRLOMOIQJF3CK6D",
    "Account": "784874566428",
    "Arn": "arn:aws:iam::784874566428:user/Terraform-User"
}
```

We'll need to generate AWS CLi creds in order to user the AWS CLI

## Terraform Basic

### Terraform Registry

Terraform sources their providers and modules from the terraform registry which is located [registry.terraform.io](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string)

- **Providers** is an interface to API's that will allow to creat resources in terraform
- **Modules** are a way to make large amounts of terraform code modular, portable and sharable.

[Random Terraform Providers](https://registry.terraform.io/browse/providers)
### Terraform Console

We can see a list of all the Terraform commands by simply typing `terraform`

#### Terraform Init

At the start of a new terraform project or we will run terraform init to download the binaries for the terraform providers that we'll use in this project 

#### Terraform Plan

`terraform plan`
this will generat out a changeset, about the state of our infrastructure and what will be changed.

We can output this changeset ir. "plan" to be passed to an apply, but often you can just ignore outputing.

#### Terraform Apply

`terraform apply`
This will run a plan and pass the changes that were made to be executed by terraform, Apply should prompt us with a yes or no

If we want to have an auto approval you can use the auto approve command eg. `terraform apply --auto-approve`

#### Terraform Destroy

`terraform destroy`
This command will destroy all resources that were created.

you can also use the auto approve flag to skip the approve prompt eg. `terraform apply --auto-approve`

### Terraform Lock Files

`.terraform.lock.hcl` contains the locked versioning for the providers or modules that should be used with this project.

The terraform lock file should be committed to your Version Contraol System (VCS) eg. Github

### Terraform State Files

`.terraform.tfstate` contains information about the current state of your infrasturcuture.

This file ***should not be committed** to your VCS

If you lose this file, you lose knowing the state of your infrastructure 

`.terraform.tfstate.backup` is the previous state file state.

### Terraform Directory

`.terraform` contains directories of terraform providers

## Issues with Terracloud and gitpod workspace

When attempting to run `terraform login` it will launch bash a wiswig view to generate a token. However it does not work expected in Gitpod VsCode in the browser.

The workaround is manually generate a token in Terraform CLoud 

```sh
https://app.terraform.io/app/settings/tokens

```

[
    "credentials": {
        "app.terraform.io": {
            "token": "Terraform-token"
        }
    }
]

Then create open the file manually here:

```sh
touch  /home/gitpod/.terraform.d/credentials.tfrc.json
open  /home/gitpod/.terraform.d/credentials.tfrc.json

```

Then open the file

``````

We have automated the process the using the following bash script [bin/generate_tfrc_credentials](bin/generate_tfrc_credentials)