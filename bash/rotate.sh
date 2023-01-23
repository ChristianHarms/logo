#!/bin/bash

if [`which convert` -eq ""]
then
  echo "brew install imagemagick jp2a"
  exit 1
fi

for degree in {1..360}
do
  convert ../logo.png -rotate $degree logo.jpg
  jp2a -z logo.jpg
done
rm logo.jpg