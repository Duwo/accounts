#!/bin/sh
chown -R uwsgi accounts_static 
chown -R uwsgi accounts_media
su -m uwsgi -c "/usr/local/bin/uwsgi --ini /mysite.ini"