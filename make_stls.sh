#!/bin/bash

{

# Exit on error
set -o errexit
set -o errtrace

openscad="/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD"
timestamp=$(git --no-pager log -1 --date=unix --format="%ad")
dir="local/3d-models/$timestamp"

mkdir -pv $dir

function export_stl() {
    stub="$1"
    override="$2"

    filename="$dir/$stub-$timestamp.stl"

    echo "Exporting $filename..."

    $openscad "openscad/assembly.scad" \
        -o "$filename" \
        -D 'ECHO_DIMENSIONS=false' \
        -D 'SHOW_ENCLOSURE_BOTTOM=false' \
        -D 'SHOW_BATTERY=false' \
        -D 'SHOW_SPEAKER=false' \
        -D 'SHOW_PCB=false' \
        -D 'SHOW_VOLUME_WHEEL=false' \
        -D 'SHOW_HITCH=false' \
        -D 'SHOW_MOUNTING_RAIL=false' \
        -D 'SHOW_KEYS=false' \
        -D 'SHOW_ENCLOSURE_TOP=false' \
        -D "$override=true"

    echo
}

export_stl 'enclosure_bottom' 'SHOW_ENCLOSURE_BOTTOM'
export_stl 'volume_wheel' 'SHOW_VOLUME_WHEEL'
export_stl 'hitch' 'SHOW_HITCH'
export_stl 'mounting_rail' 'SHOW_MOUNTING_RAIL'
export_stl 'keys' 'SHOW_KEYS'
export_stl 'enclosure_top' 'SHOW_ENCLOSURE_TOP'

}
