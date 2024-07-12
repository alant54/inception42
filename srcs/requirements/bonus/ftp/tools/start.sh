#!/bin/bash

if [ ! -f "/ftp_configured" ];
then
    echo "Configuring FTP server..."
    mkdir /var/run/empty
    adduser $FTP_USER --gecos "First Last,RoomNumber,WorkPhone,HomePhone" --disabled-password
    echo "$FTP_USER:$FTP_PWD" | chpasswd
    #chown -R $FTP_USER:$FTP_USER /mnt/ftp
    echo $FTP_USER | tee -a /etc/vsftpd.userlist
    touch /ftp_configured
fi

echo "Starting FTP server..."
vsftpd /etc/vsftpd.conf