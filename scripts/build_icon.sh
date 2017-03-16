#!/bin/bash


#cat test.svg |sed -e "s/#ffffff/patata/g"
#inkscape test.svg --export-width=100 --export-background-opacity=0 --export-png test.png
# “a” and “arga” have optional arguments with default values.
# “b” and “argb” have no arguments, acting as sort of a flag.
# “c” and “argc” have required arguments.

# set an initial value for the flag
progname=$0
OUTPUT=./

function usage () {
   cat <<EOF
Usage: $progname [-c input_color] [-C output_color] [-b background_opacity] [-w width] [-h height] [-i input_file] [-o output_file] etc
EOF
   exit 0
}
if [ ! $1 ]; then
  usage
  exit 0
fi
while getopts ":c:C:w:h:b:i:o:H" opt; do
  case $opt in
    c )  ICOLOR=$OPTARG ;;
    C )  OCOLOR=$OPTARG ;;
    b )  ALPHA=$OPTARG ;;
    h )  HEIGHT=$OPTARG ;;
    w )  WIDTH=$OPTARG ;;
    o ) OUTPUT=$OPTARG ;;
    i ) INPUT=$OPTARG ;;
    H )  usage ; exit 0;;
    *)  ;; #usage ;;
   esac
done

if [ ! $INPUT ]; then
  echo "Program needs an input file!"
  usage
  return 1
fi
if [ ! $OUTPUT ]; then
  echo "Program needs an output file!"
  usage
  return 1
fi

FILENAME=${INPUT%%.*}
FILENAME=${FILENAME##*/}

if [ $ICOLOR ] && [ $OCOLOR ]; then
   echo "$(cat $INPUT | sed -e 's/4d4d4d/AAAAAA/g')" >> swap.svg
   INPUT='./swap.svg'
fi
CMD="inkscape $INPUT"

if [ $WIDTH ]; then
    CMD+=" --export-width=$WIDTH"
fi
if [ $HEIGHT ]; then
    CMD+=" --export-height=$HEIGHT"
fi
if [ $ALPHA ]; then
    CMD+=" --export-background-opacity=$ALPHA"
fi
CMD+=" --export-png $OUTPUT/$FILENAME.png"
echo $($CMD)

[ -f swap.svg ] && rm swap.svg
