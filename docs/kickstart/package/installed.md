# kickstart.package.installed package_name
Return 0 if `package_name` is installed by the current package manager or 1 if not


### Example

```bash
$ kickstart.package.installed nodejs || echo "Package not installed"
```
