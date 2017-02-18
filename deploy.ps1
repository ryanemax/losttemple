rsync -aztP --exclude-from "ignore.list" --delete ~/note/ content
hugo -D

git add -A
git commit -m "update"
git push origin master

git subtree push --prefix=public blog gh-pages
git subtree push --prefix=public blog-coding gh-pages
