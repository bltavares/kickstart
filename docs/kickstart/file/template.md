# kickstart.file.template file [positional arguments...]

Receives a file for templating, eval the arguments and return it.
It evals the file under the current environement, with the variables and functions available.

### Example

```bash
$ cat file
\$argument is $argument
$ argument=awesome kickstart.file.template file
$argument is awesome

$ cat file
$1, $2 and $3
$ kickstart.file.template file Alice Bob Eve
Alice, Bob and Eve
```
