# gameover

A new Flutter project.

Publish build to Github Pages:

```
    flutter build web
    git commit -am "push updated build"
    git push origin --delete gh-pages
    git subtree push --prefix build/web origin gh-pages
```