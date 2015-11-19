# kickstart
Bash only provisioning tool.

The idea is to use bash scripts to provision machines over ssh, with no client installation on the target.
It provides some abstractions and functions that help you structure and write more readable bash scripts.

For an example project, check [tty.space project](https://github.com/bltavares/tty.space) or
[kickstart-baseline](https://github.com/bltavares/kickstart-baseline).

### Goal

* No installation on the target
* Over ssh, or local
* Portable (Mac, Linux, containers and so on)


### Documentation

Kickstart provides offline documentation using the `kickstart doc` command as well as an online on http://bltavares.viewdocs.io/kickstart.

Autocompletion is enabled for the offline documentation.

### Installation

#### Adding to the shell

Add it to the path.

One options is to download it, and export the bin folder into your PATH
```bash
# Adjust the paths to your preferred location
installation_path=/opt/kickstart
shell_configuration=$HOME/.bashrc

git clone https://github.com/bltavares/kickstart.git $installation_path
echo 'export PATH=$PATH:'$installation_path'/bin' >> $shell_configuration
```

#### Link under /usr/local/bin

The other is to link the `bin/kickstart` into a place that is already on your path.

This will allow `sudo` to see the `kickstart` command.
```bash
# Adjust the paths to your preferred location
installation_path=/opt/kickstart

git clone https://github.com/bltavares/kickstart.git $installation_path
sudo ln -s $installation_path/bin/kickstart /usr/local/bin/kickstart
```

#### Homebrew

```bash
brew tap bltavares/tap
brew install --HEAD kickstart
```

### Autocompletion

To enable autocompletion run the following command:

```bash
shell_configuration=$HOME/.bashrc
echo 'eval "$(kickstart autocomplete)"' >> $shell_configuration
```

Adjust the shell configuration variable if you use a different shell.

### Usage

#### create
Creates a sample project structure

```bash
kickstart create [folder name or current folder]
```

#### docker-create
Creates a docker container with a running sshd to test recipes

```bash
kickstart docker-create [image-name]
```

#### docker-ssh
Access the created docker container over ssh. A simple utility that looks up for the port the docker is bound.

```bash
kickstart docker-ssh [image-name]
```


#### compile
Compile the current workspace into the folder to be packaged on deploy

```bash
kickstart compile
```

#### deploy
Takes an host target and deploy the compiled code on it.

```bash
kickstart deploy [--sudo] [--password PASSWORD] target [roles ...]
```

##### Examples
Deploy a role on a host

```bash
kickstart deploy vagrant@localhost nodejs
```

Deploy two roles on a host with an alternative port

```bash
kickstart deploy "-p 2222 vagrant@localhost" nodejs redis
```

Deploy with sudo and send the password for sudo

```bash
kickstart deploy --sudo --password vagrant "-p 2222 vagrant@localhost" nodejs redis
```

#### local
Deploy localy a recipe that is not over ssh. It basicaly compile and run the install script

```bash
kickstart local [--sudo] [roles ...]
```

#### infect
Infect your shell with the kickstart utility functions

```bash
eval "$(kickstart infect)"
```

#### bootstrap
Install kickstart on the target

```bash
kickstart bootstratp [target]
```

##### Example
Using default ssh configurations

```bash
kickstart bootstrap vagrant@vagrant
```

Using alternate ssh port
```bash
kickstart bootstrap "-p 2222 vagrant@vagrant"
```

#### doc
Show documentation for a kickstart function

```bash
kickstart doc [function name]
```

##### Example
List all documented functions

```bash
kickstart doc
```

Show documentation for a function

```bash
kickstart doc kickstart.os
```

#### autocomplete
Enable autocompletion on your terminal

```bash
eval "$(kickstart autocomplete)"
```

### Debugging
Prepend DEBUG=1 to the command and you will see massive ammount of commands on your screen

```bash
DEBUG=1 kickstart local nodejs
```

### Choosing the docker image to use
You can choose an specific image to use on the docker-* commands.

On order, it looks up for an image as an argument, on the `KICKSTART_DOCKER_IMAGE` env variable or defaults to moul/sshd.
You can use any image that is on the index, you probably want it to have an sshd running by default.

Docker images tested:

* [moul/sshd](https://index.docker.io/u/moul/sshd/)
* [bltavares/centos-ssh](https://index.docker.io/u/bltavares/centos-ssh/)
* [bltavares/arch-ssh](https://index.docker.io/u/bltavares/arch-ssh/)

### Packaging

#### .deb
You need to have make and fpm installed.

```bash
make deb
```

### Thanks
This project was inspired on [sunzi](https://github.com/kenn/sunzi)
