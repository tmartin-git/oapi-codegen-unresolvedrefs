#!/bin/bash
sed -n '/var swaggerSpec/,/}/ { /^var/ d; /}/ d; s/[[:space:]]"//; s/",//; p }' | base64 -d | gzip -d
