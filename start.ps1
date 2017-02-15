# 如果需要隐藏文章
# 方式一：最前方加. 例如：
# .心理学三级学习计划.md
# .secret.md
# 方式二：编辑exclude文件./ignore.list
rsync -aztP --exclude-from "ignore.list" --delete ~/note/ content

#hugo server -w -D -t material-design
hugo server --bind 0.0.0.0 -w -D -t hueman-ryn --baseUrl http://localhost:1313/
