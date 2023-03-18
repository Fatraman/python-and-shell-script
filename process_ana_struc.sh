#!/bin/bash
#

DIR=`ls .`
for dir in ${DIR};do
	if [ -d ${dir} ];then
		echo $dir
		cp ana_structures.csh ${dir}
		cd ${dir}
		pwd
		./ana_structures.csh
                sed -i "s/file.nam/${dir}/g" ave_sd.txt
                mv ave_sd.txt   ${dir}.txt
		cd ..
	fi
done
