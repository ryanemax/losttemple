echo -e "\033[0;32mCopying *.md from ~/Note to Blog...\033[0m"
# 如果需要隐藏文章
# 方式一：最前方加. 例如：
# .心理学三级学习计划.md
# .secret.md
# 方式二：编辑exclude文件./ignore.list
rsync -aztP --exclude-from "ignore.list" --delete ~/Note/ content

#hugo server -w -D -t material-design 
hugo server -w -D -t base16-ryn
