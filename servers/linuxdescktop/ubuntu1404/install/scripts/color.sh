#!/bin/bash
echo
for code in `seq 0 255`; do echo -en "\033[38;05;${code}m $code"; done
echo
echo
echo
echo -e "\033[30m 黑色字 \033[0m"  "\033[40;37m 黑底白字 \033[0m" 
echo -e "\033[31m 红色字 \033[0m"  "\033[41;37m 红底白字 \033[0m" 
echo -e "\033[32m 绿色字 \033[0m"  "\033[42;37m 绿底白字 \033[0m" 
echo -e "\033[33m 黄色字 \033[0m"  "\033[43;37m 黄底白字 \033[0m" 
echo -e "\033[34m 蓝色字 \033[0m"  "\033[44;37m 蓝底白字 \033[0m" 
echo -e "\033[35m 紫色字 \033[0m"  "\033[45;37m 紫底白字 \033[0m" 
echo -e "\033[36m 天蓝字 \033[0m"  "\033[46;37m 天蓝底白字 \033[0m" 
echo -e "\033[37m 白色字 \033[0m"  "\033[47;30m 白底黑字 \033[0m"   
echo
echo -e "\033[0m OK"

echo "Bash tips:"
echo '$*' $* 
echo '$@' $@
echo '$#' $#
echo '$?' $?
echo '$-' $-
echo '$_' $_
echo '$$' $$

ls b.txt &>/dev/null 
echo '$!' $!
echo '$0' $0

_fullpath=`readlink -f $0`
echo $_fullpath
echo `dirname $_fullpath`

strspace="a b c d e"
strtab="a	b	c	d	e"
strlf="a
b c d
e"

IFS=$'\n'
echo "IFS=$'\n'"
_str=$strspace
echo strspace
for x in $_str; do echo "=$x=";done
echo
_str=$strtab
echo strtab
for x in $_str; do echo "=$x=";done
echo
_str=$strlf
echo strlf
for x in $_str; do echo "=$x=";done
echo

