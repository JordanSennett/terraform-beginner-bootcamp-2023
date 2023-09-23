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