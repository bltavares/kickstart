# kickstart.user.home_folder user

Looks up the `user` home folder on the `/etc/passwd` file.

### Example

```bash
$ kickstart.user.home_folder vagrant
/home/vagrant

$ kickstart.user.home_folder root
/root

$ kickstart.user.home_folder no-user-existing

```
