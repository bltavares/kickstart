# kickstart.module.apply_recipe module_name recipe_name

Apply `recipe_name` from `module_name`.
`module_name` is the name of the module under the `modules` folder.
`recipe_name` is the name of the recipe under the `modules/module_name/recipes/recipe_name.sh`, without the .sh

### Example

```bash
$ kickstart.module.apply_recipe kickstart-baseline gcc
```
