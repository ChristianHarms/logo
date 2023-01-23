#!/bin/bash

if [ ! -f `which convert` ]
then
  echo "brew install imagemagick"
  exit 1
fi

echo "Generating 360 frames."
for degree in {1..360}
do
  tmp=$(printf "%03d" $degree)
  convert ../logo.png -distort ScaleRotateTranslate $degree "x_"$tmp.gif
done
ls
echo "Generating animated gif."
convert -delay 3 -loop 0 x_* ani_logo.gif
rm x_*
echo "Done as ani_logo.gif"
