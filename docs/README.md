# Bucket Website Source

Within this folder we store the latest website.
Note that in this branch the generated dist files are ignored,
but are not ignored in the `pages` branch.

## Build and Publish

```
docs/build.sh
git commit -am "..."
git push origin main
git checkout pages
git merge main
git push origin pages
```
