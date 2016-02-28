#!/bin/sh

names=`find . -name '*.pdf' -print`
for i in $names
do
	basename="${i%.pdf}"
	if test -f "$basename.svg"
	then
		:
	else
		rm -f "$i"
	fi
done


names=`find . -name '*.pd' -print`
for i in $names
do
	basename="${i%.pd}"
	if test -f "$basename.svg"
	then
		:
	else
		rm -f "$i"
	fi
done
