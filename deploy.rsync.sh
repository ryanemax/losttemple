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

# Push to Host
hugo && rsync -avz --delete public/ www-data@cio.anasit.com:~/www/