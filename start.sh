#!/bin/sh

if [ "$FREESWITCH" != "" ] ; then
    sed -ri "s/FREESWITCH/$FREESWITCH/g" /etc/kamailio/dbtext/dispatcher;
fi

if [ "$FREESWITCH_BACKUP" != "" ] ; then
    echo "2 sip:$FREESWITCH_BACKUP 0" >> /etc/kamailio/dbtext/dispatcher;
fi

kamailio -f /etc/kamailio/kamailio.cfg