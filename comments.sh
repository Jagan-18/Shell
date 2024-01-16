#!/bin/bash:wq

# -----> This is single line comment
echo "We are commenting multiple line"
<<COMMENT1
 I am commenting here multiple lines
 using HERE DOCUMENT
 feature
COMMENT1
echo "Multilane comment done"