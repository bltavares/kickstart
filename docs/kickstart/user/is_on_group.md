# kickstart.user.is_on_group user group
Return 0 if `user` is on `group`, and 1 if not.

### Example

```bash
$ kickstart.user.is_on_group vagrant vagrant && echo yup
yup

$ kickstart.user.is_on_group vagrant no_group || echo nope
nope
```
