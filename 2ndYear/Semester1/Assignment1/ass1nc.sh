#!/bin/bash
# Assignment 1 Alan Kelly r00052131 DNet2
echo -n "Please enter name of source directory: "
read s
if [[ -z "${s}" ]]
then
	echo "${0}:ERROR:No directory entered." 1>&2
	echo "${0}:USAGE:Enter a name for the source directory." 1>&2
	exit 9
fi
if test ! -d "${s}"
then
	echo "${0}:ERROR:No directory ${s} exits." 1>&2
	echo "${0}:USAGE:Enter the name of an existing directory to search." 1>&2
	exit 8
fi
echo -n "Please enter name of file to copy: "
read file
if test -z "${file}" 
then
	echo "${0}:ERROR:No directory name entered." 1>&2
	echo "${0}:USAGE:Enter the name of an existing file." 1>&2
	exit 7
fi
if test ! -f "${s}/${file}"
then #if file does not exist alerts user with error and stops program
	echo "${0}:ERROR:${file} does not exist in directory ${s}" 1>&2
	echo "${0}:USAGE:Enter the name of an existing file in directory ${s}." 1>&2
	exit 6
fi
echo -n "Please enter name of destination directory: "
read des
if test -z "${des}" 
then
	echo "${0}:ERROR:No directory name entered." 1>&2
	echo "${0}:USAGE:Enter the name of a new destination directory." 1>&2
	exit 5
fi
if test  -d "${des}"
then
	echo "${0}:ERROR:directory ${des} already exits." 1>&2
	echo "${0}:USAGE:Enter the name of an NEW directory." 1>&2
	exit 4
fi
if  test ! -e "${des}"
then
	if mkdir "${des}" 
	then
		echo "${0}:INFO:${des} created." 1>&2
		else
		echo "${0}:ERROR:Failed to create ${des}" 1>&2
		echo "${0}:INFO:Check permissions or disk space." 1>&2
		exit 3 
	fi
else
	echo "${0}:ERROR:Failed to create ${des}." 1>&2
	echo "${0}:INFO:${des} already exists as a file and Enter the name of an NEW directory with a unique name" 1>&2
	exit 2 
fi
if cp ${s}/${file} ${des} 
then
	echo "${0}:copy was successful" 1>&2
	else
	echo "${0}:ERROR:Failed to create ${des}" 1>&2
	echo "${0}:INFO:Check permissions or disk space." 1>&2
	exit 1 
fi

