#!/usr/bin/env bash

trap ctrl_c INT

function ctrl_c() {
        echo ""
        echo "* Cleanup"
        latexmk -C
        echo "* Kill child processes"
        kill 0
}

latexmk -pdf -halt-on-error

# If this does not work run
# cmd.exe /C "cd C:\Program Files\VcXsrv && xlaunch.exe"

PDF_FILE=( ./*.pdf )

okular "${PDF_FILE[0]}" &

latexmk -pdf -pvc -halt-on-error