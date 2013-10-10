#!/bin/bash

./scriv-get-xml.pl ~/Dropbox/Indiana\ Work/IS\ exams/qualifying\ paper.scriv | \
./scriv-get-for-compile.pl | \
./scriv-get-rtf-for-conversion.pl ~/Dropbox/Indiana\ Work/IS\ exams/qualifying\ paper.scriv \
> test.txt

