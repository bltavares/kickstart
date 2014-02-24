# kickstart.profile.add_to_profile file.sh
This module adds `file.sh` located on `files/` to bash and zsh profiles.
It allows you to append to PATH or define alias, for example.

It will add your file into the appropriate profile.d folder, depending of your OS and if you are root.
Then it will add to the proper shell configuration file to source your `file.sh`

### Example

```bash
$ kickstart.profile.add_to_profile cabal.sh
```
