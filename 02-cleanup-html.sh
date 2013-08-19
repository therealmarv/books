#!/bin/bash
#
# Remove <?xml version="1.0"?> in the middle of files to produce valid XML
#
# use homebrew gfind on OS X or find on GNU systems (like Linux)
cd content
gfind -iname "*.xhtml" | while read f; do
    echo Remove CNX specific content from HTMLs in $f
    xsltproc ../cleanup-html.xsl $f -o $f.cleanup
    mv -f $f.cleanup $f
done
