#!/bin/bash
#
# Remove <?xml version="1.0"?> in the middle of files to produce valid XML
#
# use homebrew gfind on OS X or find on GNU systems (like Linux)
cd content
gfind -iname "*.xhtml" | while read f; do
    echo Remove strange lines in $f
    sed '/<?xml version="1.0"?>/d' $f > $f-corrected
    mv -f $f-corrected $f
    xmllint --noout $f
done
