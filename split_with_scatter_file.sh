#!/bin/bash

SCATTERFILE=$1
ROM=$2
DIR=$3

fail() {
  echo $1 1>&2
  exit $2
}

[ $# -eq 2 ] || fail "Usage: `basename $0` scatter_file rom_file [directory]" 1

if [[ -z "${DIR// }" ]] ; then
    DIR=partitions
fi

rm -rf $DIR
mkdir $DIR

scan()
{
    arg1=$(echo $1 | sed -e "s/[[:space:]]\+/ /g")
    arg2=$(echo $2 | sed -e "s/[[:space:]]\+/ /g")
    if [[ $arg1 == $arg2* ]] ; then
	echo ${arg1#"$arg2"} | sed -e "s/[[:space:]]\+/ /g"
	return 1
    fi
    return -1
}

PARTITION_INDEX=""
PARTITION_NAME=""
FILE_NAME=""
IS_DOWNLOAD=""
LINEAR_START_ADDR=""
PARTITION_SIZE=""
TYPE=""

copy()
{
    if [[ -z "${PARTITION_INDEX// }" ]] ; then
	return
    fi

    if [[ -z "${LINEAR_START_ADDR// }" ]] ; then
	return
    fi

    if [[ -z "${PARTITION_SIZE// }" ]] ; then
	return
    fi

    if [ "$IS_DOWNLOAD" != "true" ] ; then
	return
    fi

    name=${PARTITION_INDEX}.$TYPE
    if [[ ! -z "${FILE_NAME// }" ]] && [ "$FILE_NAME" != "NONE" ] ; then
	name=$FILE_NAME
    else
	if [[ -z "${PARTITION_NAME// }" ]] ; then
	    name=${PARTITION_NAME}.$TYPE
	fi
    fi

    echo if=$ROM of=$DIR/$name bs=$(( 0x1000 )) iflag=skip_bytes,count_bytes skip=$(( $LINEAR_START_ADDR )) count=$(( $PARTITION_SIZE ))
    dd if=$ROM of=$DIR/$name bs=$(( 0x1000 )) iflag=skip_bytes,count_bytes skip=$(( $LINEAR_START_ADDR )) count=$(( $PARTITION_SIZE ))
    echo
}

while IFS= read -r line
do
    RESULT=$(scan "$line" "- partition_index:")
    if [ $? == 1 ] ; then
	copy
	PARTITION_INDEX=$RESULT
    else
	RESULT=$(scan "$line" "partition_name:")
	if [ $? == 1 ] ; then
	    PARTITION_NAME=$RESULT
	else
	    RESULT=$(scan "$line" "file_name:")
	    if [ $? == 1 ] ; then
		FILE_NAME=$RESULT
	    else
		RESULT=$(scan "$line" "is_download:")
		if [ $? == 1 ] ; then
		    IS_DOWNLOAD=$RESULT
		else
		    RESULT=$(scan "$line" "linear_start_addr:")
		    if [ $? == 1 ] ; then
			LINEAR_START_ADDR=$RESULT
		    else
		        RESULT=$(scan "$line" "partition_size:")
			if [ $? == 1 ] ; then
			    PARTITION_SIZE=$RESULT
			else
			    RESULT=$(scan "$line" "type:")
			    if [ $? == 1 ] ; then
				TYPE=$RESULT
			    fi
			fi
		    fi
		fi
	    fi
	fi
    fi

done < $SCATTERFILE
