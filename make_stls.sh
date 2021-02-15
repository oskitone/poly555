#!/bin/bash

{

# Exit on error
set -o errexit
set -o errtrace

prefix="p5"

openscad="/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD"
timestamp=$(git --no-pager log -1 --date=unix --format="%ad")
commit_hash=$(git rev-parse --short HEAD)
dir="local/3d-models/$timestamp-$commit_hash"

mkdir -pv $dir

function export_stl() {
    stub="$1"
    override="$2"
    flip_vertically="$3"

    filename="$dir/$prefix-$stub-$timestamp-$commit_hash.stl"

    echo "Exporting $filename..."

    $openscad "openscad/poly555.scad" \
        -o "$filename" \
        -D 'ECHO_DIMENSIONS=false' \
        -D 'SHOW_ENCLOSURE_BOTTOM=false' \
        -D 'SHOW_BATTERY=false' \
        -D 'SHOW_SPEAKER=false' \
        -D 'SHOW_SWITCH=false' \
        -D 'SHOW_PCB=false' \
        -D 'SHOW_VOLUME_WHEEL=false' \
        -D 'SHOW_MOUNTING_RAIL=false' \
        -D 'SHOW_KEYS=false' \
        -D 'SHOW_ENCLOSURE_TOP=false' \
        -D 'SHOW_WINDOW_PANE=false' \
        -D 'CROSS_SECTION=undef' \
        -D "$override=true" \
        -D "FLIP_VERTICALLY=$flip_vertically"

    echo
}

export_stl 'enclosure_bottom' 'SHOW_ENCLOSURE_BOTTOM' 'false'
export_stl 'enclosure_top' 'SHOW_ENCLOSURE_TOP' 'true'
export_stl 'keys' 'SHOW_KEYS' 'false'
export_stl 'mounting_rail' 'SHOW_MOUNTING_RAIL' 'false'
export_stl 'volume_wheel' 'SHOW_VOLUME_WHEEL' 'true'
export_stl 'reduced_test_case' 'REDUCED_TEST_CASE' 'false'

}
