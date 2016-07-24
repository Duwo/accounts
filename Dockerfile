FROM python:3.4
RUN groupadd -r uwsgi && useradd -r -g uwsgi uwsgi

ADD /requirements /requirements
COPY /dist/induwo-accounts-0.2.tar.gz /requirements/
ADD /requirements.txt /requirements.txt
RUN pip install -r /requirements.txt
RUN pip install  /requirements/induwo-accounts-0.2.tar.gz

ADD /mysite /app/mysite
COPY /manage.py /app/manage.py
RUN chown -R uwsgi /app

ADD /accounts_media /accounts_media
RUN chown -R uwsgi /accounts_media

ADD /accounts_static /accounts_static
ADD /bower_components /app/bower_components
RUN chown -R uwsgi /accounts_static
RUN chown -R uwsgi /app/bower_components

ADD /mysite.ini /mysite.ini
RUN chown uwsgi mysite.ini
ADD /uwsgi.sh /uwsgi.sh
RUN chmod +x /uwsgi.sh
