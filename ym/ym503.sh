#!/bin/sh 
export PATH=$PATH:/usr/sbin
TODAY=`date +%Y%m%d`
ANS=`sudo grep -c 'HTTP/1.1" 503' /var/log/httpd/www.ya-man.com_access_log_${TODAY}.log`
MAIL_TO="fj8531cn@aa.jp.fujitsu.com"
MAIL_FROM="test@foobar.com"
SUBJECT="メールテスト"
DATA="データ"

#503があるばあい
mail_send () {

cat << EOD | nkf -j -m0 | sendmail -t
From: ${MAIL_FROM}
To: ${MAIL_TO}
Subject: ${SUBJECT}
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-2022-JP"
Content-Transfer-Encoding: 7bit


本日は${ANS}件です。

EOD
}
#503が0件のばあい
zeromail_send () {

cat << EOD | nkf -j -m0 | sendmail -t
From: ${MAIL_FROM}
To: ${MAIL_TO}
Subject: ${SUBJECT}
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-2022-JP"
Content-Transfer-Encoding: 7bit


本日はございません。

EOD
}
if [ ${ANS} -eq 0 ]; then
zeromail_send
else
mail_send
fi
exit 0
