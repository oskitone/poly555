#!/bin/bash

# USAGE:
# ./animate.sh SLUG FRAMERATE
# ./animate.sh development 3

{

set -e # stop script on error

input_file="blm.scad"

slug="$1"
frames="$2"
framerate="$3"

openscad="/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD"

end=$(echo "$frames - 1" | bc -l)

for i in $(seq -f "%03g" 0 $end); do
    t=$(echo "$i / $frames" | bc -l)

    filename="$slug-$frames-$framerate-$i.png"

    printf "$i:\t$t\t$filename\n"

    $openscad "$input_file" -o "$filename" \
        -D "T=$t" \
        -D "DEBUG=false" \
        --imgsize=1080,1080 \
        --camera=0,0,0,0,0,0,375 \
        --colorscheme DeepOcean \
        --quiet
done

convert "$slug-$frames-$framerate-*.png" -set delay 1x$framerate "$slug-$frames-$framerate.gif"

gifsicle -O3  --colors 256 < "$slug-$frames-$framerate.gif" > "$slug-$frames-$framerate-256.gif"
gifsicle -O3 --colors 128 < "$slug-$frames-$framerate.gif" > "$slug-$frames-$framerate-128.gif"
gifsicle -O3 --colors 64 < "$slug-$frames-$framerate.gif" > "$slug-$frames-$framerate-064.gif"
gifsicle -O3 --colors 32 < "$slug-$frames-$framerate.gif" > "$slug-$frames-$framerate-032.gif"
gifsicle -O3 --colors 16 < "$slug-$frames-$framerate.gif" > "$slug-$frames-$framerate-016.gif"
gifsicle -O3 --colors 8 < "$slug-$frames-$framerate.gif" > "$slug-$frames-$framerate-008.gif"

ffmpeg \
    -r "$framerate" \
    -pattern_type glob -i "$slug-$frames-$framerate-*.png" \
    -movflags faststart \
    -pix_fmt yuv420p \
    -vb 10000k \
    "$slug-$frames-$framerate.mp4"

}
