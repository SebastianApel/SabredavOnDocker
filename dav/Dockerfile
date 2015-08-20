# sudo docker build -t iruka/caldavsrvr:latest .
# This is a comment
FROM iruka/caldavsrvr:base
MAINTAINER Sebastian Apel <sebastian@iruka.com>

COPY . /tmp/dockerdav

#RUN ls -l /tmp/dockerdav

RUN cd /tmp/dockerdav/; ./00-provision.sh

# Make ports for apache available
EXPOSE 80 443
VOLUME ["/var/www/html/sabredav/data"]
ENTRYPOINT ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]

# sudo docker run -d -P --name web -v /src/webapp:/opt/webapp training/webapp python app.py
# sudo docker run -t -i -v /:/opt/HOST ubuntu:14.04 /bin/bash /opt/HOST/vagrant/docker/SetupUbuntuMirrors.sh
# sudo docker run -t -i ubuntu:14.04 /bin/bash

