# Fork repository and make it private

1. [Create a new private repository on Github](https://github.com/new) and make it **Private**
2. `git clone https://github.com/user/cloned-repo.git dir`
3. `cd dir`
4. Add `.gitignore`
5. `git init`
6. Check what will be committed with `git status`
7. `git add *`
8. `git commit -m "Initial commit"`
9. `git branch -M main`
10. `git remote add origin https://github.com/user/created-repo.git`
11. InteliJ IDEA: `git push -u origin main`
12. `git remote add upstream https://github.com/user/cloned-repo.git`
13. `git remote set-url --push upstream DISABLE`
14. You can list all your remotes with `git remote -v`
15. InteliJ IDEA: `CTRL + SHIFT + ALT + S` -> `Modules` -> `Import Module`
16. InteliJ IDEA: `Git` tab -> `Log` tab -> `Open New Git Log Tab` (`+` icon) -> `Branch` -> `Select...` -> `origin/main | upstream/main` -> `CTRL + Enter` -> `Paths` -> `Choose module`