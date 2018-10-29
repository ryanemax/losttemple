rsync -aztP --exclude-from "ignore.list" --delete ~/note/ content
hugo -D

git add -A
git commit -m "update"
git push origin master


# publish-ghpages.md
## add this line to .git/config
## [remote "blog-coding"]
##  url = https://git.coding.net/ryn/blog.git
##  fetch = +refs/heads/*:refs/remotes/origin/*
git checkout master # you can avoid this line if you are in master...
git subtree split --prefix public -b gh-pages # create a local gh-pages branch containing the splitted output folder
git push -f origin gh-pages:gh-pages # force the push of the gh-pages branch to the remote gh-pages branch at origin
git push -f blog-coding gh-pages:master # force the push of the gh-pages branch to the remote gh-pages branch at origin
git branch -D gh-pages # delete the local gh-pages because you will need it: ref