#!/bin/bash
#
cd refine_omicron_7.5A
DIR=`ls .`
for dir in ${DIR};do
	if [ -d ${dir} ];then
		echo $dir
		python3 aggregate_energies.py $dir
		mv agg_desolv.csv "$dir"_desolve.csv
		mv agg_elec.csv "$dir"_elec.csv
		mv agg_hs.csv "$dir"_hs.csv
		mv agg_vdw.csv "$dir"_vdw.csv
	fi
done
