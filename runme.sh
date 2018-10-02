#!/bin/bash
infile="Rainbow-Full.png"
width=1920
inc=1
height=1080
echo $infile
counter=1
for (( i=0; i<$width; i+=$inc))
do
    echo item: $i
    echo "image_"$(printf "%05d" $counter)".png"

    convert $infile -crop $width"x"$height"+"$i"+0" "image_"$(printf "%05d" $counter)".png"

    ((counter++))
done

#attempting to get 10min duration for 1920frames, i.e. (input frame / frame rate x 60 ) x 60 x outframerate
ffmpeg -framerate 3 -i image_%05d.png -c:v libx264 -profile:v high -crf 20 -pix_fmt yuv420p -r 60 -vf scale=1920:1080 output.mp4

