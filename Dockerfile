FROM python:3.4
RUN groupadd -r uwsgi && useradd -r -g uwsgi uwsgi

ADD /requirements /requirements
ADD /requirements.txt /requirements.txt
RUN echo "\ninduwo-my_registration==0.2" >> /requirements.txt
COPY /dist/induwo-my_registration-0.2.tar.gz /requirements/induwo-my_registration-0.2.tar.gz
RUN pip install -r /requirements.txt --no-index --find-links file:///requirements

ADD /mysite /app/mysite
COPY /manage.py /app/manage.py
RUN chown -R uwsgi /app

ADD /auth_media /auth_media
RUN chown -R uwsgi /auth_media

ADD /auth_static /auth_static
ADD /bower_components /app/bower_components
RUN chown -R uwsgi /auth_static
RUN chown -R uwsgi /app/bower_components

ADD /mysite.ini /mysite.ini
RUN chown uwsgi mysite.ini
ADD uwsgi.sh /uwsgi.sh
RUN chmod +x /uwsgi.sh
