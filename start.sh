#!/bin/sh

if [ "$FREESWITCH" != "" ] ; then
    sed -ri "s/FREESWITCH/$FREESWITCH/g" /etc/kamailio/dbtext/dispatcher;
fi

if [ "$FREESWITCH_BACKUP" != "" ] ; then
    echo "2 sip:$FREESWITCH_BACKUP 0" >> /etc/kamailio/dbtext/dispatcher;
fi

echo "local0.* -/var/log/kamailio.log" >> /etc/rsyslog.d/50-default.conf;
touch /var/log/kamailio.log;
chown syslog /var/log/kamailio.log;
chgrp adm /var/log/kamailio.log;
service rsyslog restart;

kamailio -f /etc/kamailio/kamailio.cfg