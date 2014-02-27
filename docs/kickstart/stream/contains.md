# kickstart.stream.contains string_to_search
Searchs for `string_to_search` on STDIN
Returns 0 if there the stream contains the string, and 1 otherwise.

### Example

```bash
$ echo weee | kickstart.stream.contains wee && echo yup
$ echo weee | kickstart.stream.contains ahh || echo nope
```

