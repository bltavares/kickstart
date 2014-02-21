# kickstart.os.is os_name
Returns 0 if we are on the expected OS and 1 if not.

### Example

```bash
$ kickstart.os.is Ubuntu && echo We are on Ubuntu
$ ! kickstart.os.is Mac && echo We are not on Mac
$ if [ kickstart.os.is Ubuntu ]; then
    echo Getting into Ubuntu system
  fi
```
