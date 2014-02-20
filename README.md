# kickstart
Bash installation script for developer environments

### Installation
Add it to the path.

One options is to download it, and export the bin folder into your PATH
```bash
# Adjust the paths to your preferred location
installation_path=/opt/kickstart
shell_configuration=$HOME/.bashrc

git clone https://github.com/bltavares/kickstart.git $installation_path
echo 'export PATH=$PATH:'$installation_path'/bin' >> $shell_configuration
```

The other is to link the `bin/kickstart` into a place that is already on your path
```bash
# Adjust the paths to your preferred location
installation_path=/opt/kickstart
shell_configuration=$HOME/.bashrc

git clone https://github.com/bltavares/kickstart.git $installation_path
sudo ln -s $installation_path/bin/kickstart /usr/local/bin/kickstart
```

### Usage

#### create
Creates a sample project structure

```bash
kickstart create [folder name or current folder]
```

#### docker-create
Creates a docker container with a running sshd to test recipes

```bash
kickstart docker-create
```

#### docker-ssh
Access the created docker container over ssh. A simple utility that looks up for the port the docker is bound.

```bash
kickstart docker-ssh
```


#### compile
Compile the current workspace into the folder to be packaged on deploy

```bash
kickstart compile
```

#### deploy
Takes an host target and deploy the compiled code on it.

```bash
kickstart deploy [target] [roles ...]
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

#### local
Deploy localy a recipe that is not over ssh. It basicaly compile and run the install script

```bash
kickstart local [roles ...]
```

### Thanks
This project was inspired on [sunzi](https://github.com/kenn/sunzi)
