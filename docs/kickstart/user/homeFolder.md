# kickstart.user.homeFolder user

Looks up the `user` home folder on the `/etc/passwd` file.

### Example

```bash
$ kickstart.user.homeFolder vagrant
/home/vagrant

$ kickstart.user.homeFolder root
/root

$ kickstart.user.homeFolder no-user-existing

```
