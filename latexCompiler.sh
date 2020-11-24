#!/usr/bin/env bash

# DIVIDER
echo "-------------------------"

# CONSTANTS
preferredCompiler="xelatex"
preferredReader="zathura"

extension=${1:(-4)} # kind of wonky, ich weiß

# Ends the program if the registered file is not of .tex file
if [[ "$extension" != ".tex" ]]; then exit 250; fi

filenameTex=$1
filename=${1/.tex/}
filenameBib=${filename}.bib
filepath=$(dirname "$filenameTex")
file=$(basename "$filename")

# current directory handoff
scriptDir=$PWD

cd "$filepath"

TEXINPUTS="$filepath"

$preferredCompiler -file-line-error "$filenameTex"

if [[ $? != 0 ]]; then echo "Error on compiling ${filenameTex}."; fi

if [[ -e "$filenameBib" ]]; then
    biber "$filename"
	 $preferredCompiler -file-line-error "$filenameTex"
	 $preferredCompiler -file-line-error "$filenameTex"
fi

# open PDF

if [[ "$(pidof $preferredReader)" == "" ]]; then
    $preferredReader "${scriptDir}/output/${file}.pdf" &
fi

# CWD reversal
cd $scriptDir

# Cleanup
if [ -e "$filename.aux" ]; then mv "$filename.aux" mess/; fi
if [ -e "$filename.bbl" ]; then mv "$filename.bbl" mess/; fi
if [ -e "$filename.bcf" ]; then mv "$filename.bcf" mess/; fi
if [ -e "$filename.blg" ]; then mv "$filename.blg" mess/; fi
if [ -e "$filename.log" ]; then mv "$filename.log" mess/; fi
if [ -e "$filename.run.xml" ]; then mv "$filename.run.xml" mess/; fi

# Move PDF into the output folder
mv "$filename.pdf" output/
