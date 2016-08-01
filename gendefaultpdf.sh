#!/bin/sh
message1="请输入正确格式，如：./genpdf.sh <srcfile> <buildname>"
message2="例如文件：./genpdf.sh README.md readme"
message3="例如目录：./genpdf.sh anasinc/department/ depart"
if [ $# -eq 0 ]       ##判断参数是否存在
then
	echo $message1
	echo $message2
	echo $message3
	exit                     ##不存在退出
fi
if [ x$1 = x ]       ##判断参数1是否存在
then
	echo $message1
	echo $message2
	echo $message3
	exit                     ##不存在退出
fi
if [ x$2 = x ]       ##判断参数2是否存在
then
	echo $message1
	echo $message2
	echo $message3
	exit                     ##不存在退出
fi
srcfile=$1
buildname=$2
currentdir=$(pwd)

if [ -d $1 ]
then
	# 如果源文件参数是目录，则获取目录下所有.md文档
	cd $1
	srcfile=$(ls | sed "s:^:`pwd`/:")
fi

echo $srcfile

cd $currentdir

pandoc -N --template=.tpl/default.tex --variable fontsize=12pt ${srcfile} --latex-engine=xelatex --toc -o build/${buildname}.pdf --highlight-style kate -V mainfont="思源黑体 CN" -V sansfont="思源黑体 CN" -V monofont="思源黑体 CN" --wrap=preserve
firefox build/${buildname}.pdf

