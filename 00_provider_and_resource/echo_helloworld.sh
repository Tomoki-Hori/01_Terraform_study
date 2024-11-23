#! /bin/bash
echo "Hello World" > index.html
nohup bydybox httpd -f -p &