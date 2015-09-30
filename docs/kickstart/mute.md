# kickstart.mute command to run
Run the command with stdout and stder outputing to /dev/null.
Inform it is about to run.

When debug flag is enable, does not redirect stdout or stderr to help debugging.
Returns the command result.

### Example

```bash
$ kickstart.mute id root
Running "id root"
```
