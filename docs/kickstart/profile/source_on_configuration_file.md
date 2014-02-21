# kickstart.profile.source_on_configuration_file target_file profile_d_path shell_configuration_file
Checks if `profile_d_path/shell_configuration_file` contains source for `target_file`, otherwise add it.


### Example

```bash
$ kickstart.profile.source_on_configuration_file go.sh /etc/profile.d ~/.zshrc
```
