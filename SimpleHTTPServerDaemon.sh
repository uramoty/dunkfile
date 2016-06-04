# SimpleHTTPServerDaemon.sh


#!/bin/sh

FN=$1 # 若葉みーちゃん.m4v <--- ファイル。パスではない。
PW=$2 #"7kana" # mac local

function latest_id() {
	expect -c "
	spawn env LANG=C sudo find / -name \"${FN}\"
	expect \"password:\"
	send \"${PW}\n\"
	interact
	"
}
ID=`latest_id`
echo $ID > /dunkfile/getAnkerPath.txt

val_henko=`echo ${ID}|sed -e s/若葉みーちゃん.m4v//g`
echo ${val_henko}

if [[ ${val_henko} = ' /Users/uramotokatuhisa/Movies/grassCam/upload/' ]]; then
	cd ${val_henko}
    echo "${val_henko} directory found."
else		
	cd /Users/uramotokatuhisa/Movies/grassCam/upload/
    echo "${val_henko} not match with 「 /Users/uramotokatuhisa/Movies/grassCam/upload/」"
fi

/usr/bin/python -m SimpleHTTPServer 8000
