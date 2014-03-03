# kickstart.user.exec user command

Execute `command` as `user`.
It makes kickstart functions available to be used.
To use variables, like `~`, quote it, otherwise it will be resolved by the current user.

### Example

```bash
$ kickstart.user.exec vagrant whoami
vagrant

$ kickstart.user.exec vagrant kickstart.os
Ubuntu

$ kickstart.user.exec vagrant 'cd ~; pwd'
/home/vagrant
```
