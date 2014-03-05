# kickstart.debugging

Returns 0 if you are debugging, and 1 if not

### Example

```bash
$ kickstart.debugging || echo nope
nope

$ set -x; kickstart.debugging && echo yup; set +x;
+ kickstart.debugging
+ grep xtrace
+ kickstart.stream.contains on
+ grep -q on
+ set -o
+ echo yup
yup
+ set +x
```
