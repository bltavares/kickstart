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

### Thanks
This project was inspired on [sunzi](https://github.com/kenn/sunzi)
