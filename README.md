# MacBook Puppet
This is for setting up a macbook to meet the basic standards of the DevOps team.  This is a work in progress and programs and configurations might change based on feed back.  Pleae send all feedback to v.jmiller@dbi.com.

## Run The Script
Run the script to setup you computer and trigger a puppet apply.

	./setup_macbook.sh

This code currently installs the following:

1. Puppet
2. XCode Command Line Tools
3. Docker Desktop
4. Sublime Text 4
5. Vagrant
6. Oracle Virtualbox
7. newrelic-cli
8. akamai-cli
9. awscli
10. Terraform
11. Terragrunt
12. rbenv
13. ruby 2.7.0

This will also add git repos to ~/DevOps/.

If you wish to run puppet by itself use the following command:

	sudo FACTER_WHOAMI=$(/usr/bin/whoami) puppet apply macbook.pp --modulepath=modules
	
The FACTER_WHOAMI is used to get the current user so its not lost during the sudo. This allows puppet to configure things specific to user using that Fact.

To run it the normal way where it takes care of installing puppet.  Run the following command:

```./setup_macbook.sh```<BR>
<BR>
Enter in your sudo password to begin the process.
