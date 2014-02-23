# kickstart.module.apply_role module_name role_name

Apply `role_name` from `module_name`.
`module_name` is the name of the module under the `modules` folder.
`role_name` is the name of the role under the `modules/module_name/roles/role_name.sh`, without the .sh

### Example

```bash
$ kickstart.module.apply_role kickstart-baseline haskell
```
