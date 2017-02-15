# 如果需要隐藏文章
# 方式一：最前方加. 例如：
# .心理学三级学习计划.md
# .secret.md
# 方式二：编辑exclude文件./ignore.list
rsync -aztP --exclude-from "ignore.list" --delete ../note/ content

# Build the project.
hugo -D

# Add changes to git.
git add -A

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
	  then msg="$1"
	  fi
	  git commit -m "$msg"

	  # Push source and build repos.
	  git push origin master

    #### 分支部署参考：http://www.cnblogs.com/ajianbeyourself/p/5415131.html ####
		# git remote add -f blog https://github.com/ryanemax/ryanemax.github.io.git
		# git subtree add --prefix=public blog gh-pages --squash
		# git subtree pull --prefix=public blog gh-pages
	  git subtree push --prefix=public blog gh-pages
	  # Push source and build repos to Coding.net.
	  # git push coding master
		# git remote add -f blog-coding https://git.coding.net/ryn/blog.git
		# git subtree add --prefix=public blog-coding gh-pages --squash
		# git subtree pull --prefix=public blog-coding gh-pages
	  git subtree push --prefix=public blog-coding gh-pages
