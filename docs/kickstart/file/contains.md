# kickstart.file.contains file_name string_to_search
Searchs for `string_to_search` on `file_name`.
Returns 0 if there the file contains the string, and 1 otherwise.

### Example

```bash
$ kickstart.file.contains /etc/groups wheel && echo yup
$ kickstart.file.contains /etc/groups banana || echo nope
```

