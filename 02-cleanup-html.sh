#!/bin/bash
#
# remove 
#
# use homebrew gfind on OS X or find on GNU systems (like Linux)
cd content
gfind -iname "*.xhtml" | while read f; do
    echo Remove CNX specific content from HTMLs in $f
    xsltproc -o $f.cleanup ../cleanup-html.xsl $f 
    mv -f $f.cleanup $f
done
