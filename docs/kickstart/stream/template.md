# kickstart.stream.template [positional arguments...]

Receives from stdin the template string, eval the arguments and return it.
It evals the stream under the current environement, with the variables and functions available.

### Example

```bash
$ echo '\$argument is $argument' | \
    argument=awesome kickstart.stream.template
$argument is awesome

$ echo '$1, $2 and $3' | \
    kickstart.stream.template Alice Bob Eve
Alice, Bob and Eve
```
