#!/usr/bin/env bash


NAME=SoftwareSicherheit
USE_SUBFOLDER=true
TEXFILE=exercise.tex
RUN_OCULAR=true

trap ctrl_c INT

function ctrl_c() {
        
        DESKTOP_FILENAME="/mnt/d/Desktop/$NAME-${FOLDER%/}.pdf"
        echo ""
        echo "* Saving $(pdf_file) to $DESKTOP_FILENAME"
        cp $(pdf_file) $DESKTOP_FILENAME
        echo "* Cleanup"
        (cd $FOLDER; latexmk -C) > /dev/null 2>&1
        latexmk -C $FOLDER/exercise.tex > /dev/null 2>&1
        echo "* Kill child processes"
        kill 0
}

function pdf_file() {
        PDF_FILE=( ./*.pdf )
        echo "${PDF_FILE[0]}"
        unset PDF_FILE
}

if [ "$USE_SUBFOLDER" = "true" ]; then
        FOLDER=$(ls -d */ | tail -1)
else
        FOLDER=""
fi

echo $FOLDER$TEXFILE

latexmk -pdf -halt-on-error -shell-escape $FOLDER$TEXFILE > /dev/null

if [[ $* == *--build* ]]; then
        ctrl_c
        exit 0
fi



# If this does not work run
# cmd.exe /C "cd C:\Program Files\VcXsrv && xlaunch.exe"
if [ "$RUN_OCULAR" = "true" ]; then
        okular $(pdf_file) &
fi

latexmk -pdf -pvc -halt-on-error -shell-escape $FOLDER/$TEXFILE
