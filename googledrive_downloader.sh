#!/bin/bash
#arshia.y@gmail.com

echo "please enter FILE ID (seek it on url of browser after ?id=)"

read FILEID

echo "enter a name for file to be saved"
read FILENAME


echo "Your FILEID is $FILEID"
echo "Your FILENAME is $FILENAME"
sleep 5s
echo "your download start in 5 seconds"

TE=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate "https://docs.google.com/uc?export=download&id=$FILEID" -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')

wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$TE&id=$FILEID" -O $FILENAME
rm -rf /tmp/cookies.txt
