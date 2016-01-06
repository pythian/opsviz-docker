FROM  ubuntu
MAINTAINER devops@pythian.com

# Install required packages
RUN \
  apt-get -y update && \
  apt-get -y install python-ldap python-cairo python-django \
    python-twisted python-django-tagging python-simplejson \
    python-memcache python-pysqlite2 python-support python-pip \
    gunicorn supervisor && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/

RUN \
  pip install whisper && \
  pip install pytz && \
  pip install --install-option="--prefix=/opt/graphite" --install-option="--install-lib=/opt/graphite/lib" carbon && \
  pip install --install-option="--prefix=/opt/graphite" --install-option="--install-lib=/opt/graphite/webapp" graphite-web

RUN \
  mkdir -p /opt/graphite/storage/whisper && \
  touch /opt/graphite/storage/graphite.db /opt/graphite/storage/index && \
  chown -R www-data /opt/graphite/storage && \
  chmod 0775 /opt/graphite/storage /opt/graphite/storage/whisper && \
  chmod 0664 /opt/graphite/storage/graphite.db && \
  cd /opt/graphite/webapp/graphite && python manage.py syncdb --noinput

# Add system service config
COPY ./conf/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Add graphite config
COPY ./conf/initial_data.json /opt/graphite/webapp/graphite/initial_data.json
COPY ./conf/local_settings.py /opt/graphite/webapp/graphite/local_settings.py
COPY ./conf/carbon.conf /opt/graphite/conf/carbon.conf
COPY ./conf/storage-schemas.conf /opt/graphite/conf/storage-schemas.conf

EXPOSE  8000 2003 2004 7002

CMD ["/usr/bin/supervisord"]