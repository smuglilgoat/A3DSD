#!/bin/bash

percent="15%"

for file in `ls DSC*.JPG`
do
	nom=`basename -s .JPG $file`
	echo $nom
	convert $file -resize "$percent" "$nom"_resized.jpg
done
