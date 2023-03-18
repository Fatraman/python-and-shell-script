#! /bin/bash
# process.sh
#处理haddock运行完毕后的文件夹
#将需要的文件移出到最外层目录
#保留PDB文件和打分文件
#使用需要更改路径

DIR=`ls .`
for dir in ${DIR};do
	if [ -d ${dir} ];then
		echo $dir
		cd ${dir}
#		rm *.pdb *.param
		cd run1/structures/it1/water/
		pwd
		mv *.pdb file.list file.nam /home/yjx/文档/run_haddock/${dir}
		cd ../../../../
		rm -r run1
		cd ../
	fi
done
