#!/bin/csh
#
#保留file前10行
#
foreach iclu (file.*)
 foreach i (`cat $iclu`)
  sed '11,$d' -i file.*
  end
end
#
# extract HADDOCK score
#
foreach iclu (file.nam)
  echo "#struc haddock-score" >$iclu'_haddock-score'
  foreach i (`cat $iclu`)
    echo $i |awk '{printf "%s ",$1}'>>$iclu'_haddock-score'
    grep $i file.list | awk '{print $3}'>>$iclu'_haddock-score'
  end
end
#
# Extract buried surface area
#
foreach iclu (file.nam)
  echo "#struc bsa" >$iclu'_bsa'
  foreach i (`cat $iclu`)
    echo $i |awk '{printf "%s ",$1}'>>$iclu'_bsa'
    head -n100 $i | grep -i buried | awk '{print $5}'>>$iclu'_bsa'
  end
end
#
# Extract energies
#
foreach iclu (file.nam)
  echo "#struc Etotal  Evdw  Eelec" >$iclu'_ener'
  foreach i (`cat $iclu`)
    echo $i |awk '{printf "%s ",$1}'>>$iclu'_ener'
    head -n100 $i | grep -i energies | sed -e's/\,//g' | awk '{if(NF==15){print $3,$8,$9} else {print $3,$8,$9}}'>>$iclu'_ener'
  end
end
#
# extract binding energy
#
foreach iclu (file.nam)
  echo "#struc dH" >$iclu'_dH'
  foreach i (`cat $iclu`)
    echo $i |awk '{printf "%s ",$1}'>>$iclu'_dH'
    head -n100 $i | grep -i " Binding" | awk '{print $4}'>>$iclu'_dH'
  end
end
#
# extract desolvation energy
#
foreach iclu (file.nam)
  echo "#struc Edesolv" >$iclu'_Edesolv'
  foreach i (`cat $iclu`)
    echo $i |awk '{printf "%s ",$1}'>>$iclu'_Edesolv'
    head -n100 $i | grep -i " desolv" | awk '{print $4}'>>$iclu'_Edesolv'
  end
end
#
# Combine results in one file
# 
foreach iclu (file.nam)
  paste $iclu'_haddock-score' $iclu'_ener' $iclu'_dH'  $iclu'_bsa' $iclu'_Edesolv'\
 | awk '{print $1,$2,$4,$5,$6,$8,$10,$12}' >structures_haddock-sorted.stat
end

endif
