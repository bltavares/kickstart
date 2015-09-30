# kickstart.suppress_error command to run
Run the command with stder outputing to /dev/null.
Inform it is about to run.

When debug flag is enable, does not redirect stderr to help debugging.
Returns the command result.

### Example

```bash
$ kickstart.suppress_error dpkg -s pkg-that-does-not-exist | grep 'Status:'
Running "dpkg -s pkg-that-does-not-exist"
```

If there was an error executing `dpkg`, it will not show up on the console unless the debugg flag is enabled.
