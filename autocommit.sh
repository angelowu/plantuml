#!/bin/bash
set -e
desc=$1

if [ "$#" -ne 1 ]; then
	echo "usage: $0 <commit log>"
	exit 1
fi

#dirname $0，取得当前执行的脚本文件的父目录
#cd `dirname $0`，进入这个目录(切换当前工作目录)
#pwd，显示当前工作目录(cd执行后的)
basepath=$(cd `dirname $0`; pwd)
cd  $basepath
git add .
remark=$(date +"%Y-%m-%d %H:%M:%S")

echo -e "\n\nstart commit......"
git commit -m "${remark} - ${desc}"
git pull origin main
git push origin main

if [ $? -eq 0 ]; then
    echo -e "\n\nFinished"
   else
    echo -e "\n\nERROR"
   fi
