echo -e "\033[0;32mCopying *.md from ~/Note to Blog...\033[0m"
# 如果需要隐藏文章
# 方式一：最前方加. 例如：
# .心理学三级学习计划.md
# .secret.md
# 方式二：编辑exclude文件./ignore.list
rsync -aztP --exclude-from "ignore.list" --delete ~/Note/ content

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

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
	  git subtree push --prefix=public https://github.com/ryanemax/ryanemax.github.io.git gh-pages
	  # Push source and build repos to Coding.net.
	  git push coding master
	  git subtree push --prefix=public https://git.coding.net/ryn/coding-pages.git gh-pages
