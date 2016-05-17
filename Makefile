# This Requires a python 3.5 installation which is link to "python"
APP_NAME=induwo_registration
VERSION=0.1

install_all: clean_all requirements django install_dev

clean_all: clean clean_build
	-rm -r py3env

clean_build:
	-rm -r MANIFEST build dist/* induwo_registration.egg-info

clean:
	-rm -r mysite


requirements:
	pyvenv ./py3env ;\
	source py3env/bin/activate ;\
	pip install -r ./requirements.txt ;\
	pip install nodeenv ;\
	nodeenv -p ;\
	npm install -g bower ;\

django:
	source py3env/bin/activate ;\
	django-admin startproject mysite
	cat config_templates/url_template >> mysite/mysite/urls.py
	cat config_templates/bower_template >> mysite/mysite/settings.py
	cat config_templates/static_template >> mysite/mysite/settings.py
	cat config_templates/apps_template >> mysite/mysite/settings.py

install_dev: django
	source py3env/bin/activate ;\
	ln -s `pwd`/$(APP_NAME) mysite/$(APP_NAME) ;\
	python mysite/manage.py migrate ;\
	python mysite/manage.py bower install ;\
	python mysite/manage.py collectstatic --noinput;\

tar: 
	source py3env/bin/activate ;\
	python setup.py sdist build

