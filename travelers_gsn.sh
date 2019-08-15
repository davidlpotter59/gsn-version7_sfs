#!/bin/bash

. sfs gsn

# it should not be required to change directory but a good practice
cd /software/source/cvs_projects/davep/gsn/version7_sfs

current_directory=`pwd`
echo $current_directory
. scips_v770 gsn_monthly_submission
USAGE="Please run with the following format--> travelers_gsn.sh 080120140831201401"
if [ "$#" == "0" ]; then
        echo "$USAGE"
        exit 1
fi
cd /data/gsn_monthly_submission
/software/shells/travelers_boiler.mk

. sfs gsn
cd /software/source/cvs_projects/davep/gsn/version7_sfs

cscomp -nowarn sfsup122

if [ -f sfsup122.sb ] ; then
  {
    echo "I am done compiling"
    read me
    mv sfsup122.sb /data/gsn_monthly_submission/lib770_1a
    csbatch sfsup122 $1
  }
else
  {
    echo "ERROR compiling PROGRAM"
  }
fi
