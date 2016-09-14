#!/bin/bash
# Assignment 1 Alan Kelly r00052131 DNet2
echo -n "Please enter name of source directory: " # get the name from user of scource directory
read s #assigns the input to the variable s
if [[ -z "${s}" ]]
then #if directory not entered alerts user with error and stops program
	echo "${0}:ERROR:No directory entered." 1>&2 # error outputted to channel 1
	echo "${0}:USAGE:Enter a name for the source directory." 1>&2
	exit 9
fi
if test ! -d "${s}"
then #if directory does not exist alerts user with error and stops program
	echo "${0}:ERROR:No directory ${s} exits." 1>&2
	echo "${0}:USAGE:Enter the name of an existing directory to search." 1>&2
	exit 8
fi
echo -n "Please enter name of file to copy: "
read file #assigns the input to the variable s file
if test -z "${file}" 
then #if filename not entered alerts user with error and stops program
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
echo -n "Please enter name of destination directory: " # get the name from user of destination directory
read des #assigns the input to the variable des
if test -z "${des}" 
then #if destination not entered alerts user with error and stops program
	echo "${0}:ERROR:No directory name entered." 1>&2
	echo "${0}:USAGE:Enter the name of a new destination directory." 1>&2
	exit 5
fi
if test  -d "${des}"
then #if directory exists alerts user with error and stops program
	echo "${0}:ERROR:directory ${des} already exits." 1>&2
	echo "${0}:USAGE:Enter the name of an NEW directory." 1>&2
	exit 4
fi
if  test ! -e "${des}"
then  # if directory entered does not exist as a file
	if mkdir "${des}" 
	then  # makes new directory in current folder 
		echo "${0}:INFO:${des} created." 1>&2 # confirms created
		else # if not created OK then exit with error
		echo "${0}:ERROR:Failed to create ${des}" 1>&2
		echo "${0}:INFO:Check permissions or disk space." 1>&2
		exit 3 
	fi
else # directory entered does exist as a file but is not a directory
	echo "${0}:ERROR:Failed to create ${des}." 1>&2
	echo "${0}:INFO:${des} already exists as a file and Enter the name of an NEW directory with a unique name" 1>&2
	exit 2 
fi
if cp ${s}/${file} ${des} 
then  # tries to copy filr from source dir to new des dir
	echo "${0}:copy was successful" 1>&2 # confirms copy succesful
	else # if not copied then exit with error
	echo "${0}:ERROR:Failed to create ${des}" 1>&2
	echo "${0}:INFO:Check permissions or disk space." 1>&2
	exit 1 
fi

