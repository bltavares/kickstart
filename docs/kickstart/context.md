# kickstart.context current_context
Store the current context so kickstart.mute and kickstart.info can append the information

### Example

```bash
$ kickstart.info Some information
Some information

$ kickstart.context Ubuntu
Setting up Ubuntu
$ kickstart.info Some information
Ubuntu >> Some information
```
