HOST=$1

if [ -f ./environment_checks.txt ]
then
	rm ./environment_checks.txt
fi

ENVIRONMENT_PARAMETERS=""
TMPDIR=""
GROUP=""

if [[ "${HOST}" == "osboxes" ]]
then
    	ENVIRONMENT_PARAMETERS="parameters_HPC-Utrecht.csv"
        TMPDIR="\$TMPDIR"
elif [ "${HOST}" == "leucine-zipper.gcc.rug.nl" ]
then
    	ENVIRONMENT_PARAMETERS="parameters_leucine-zipper.csv"
        TMPDIR="tmp06"
elif [ "${HOST}" == "calculon" ]
then
    	ENVIRONMENT_PARAMETERS="parameters_calculon.csv"
        TMPDIR="tmp04"
else
    	echo "unknown host: running is only possible on calculon,HPC-Utrecht or leucine-zipper"
fi

THISDIR=$(pwd)
if [[ $THISDIR == *"/hpc/dbg_gen/"* ]]
then
	GROUP="dbg_gen" 
elif [[ $THISDIR == *"/groups/umcg-gd/"* ]] 
then
	GROUP="umcg-gd"
else
	echo "this is not a known group, please run only in dbg_gen or umcg-gaf group"
fi

printf "${ENVIRONMENT_PARAMETERS}\t${TMPDIR}\t${GROUP}" > ./environment_checks.txt
