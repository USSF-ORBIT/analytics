FROM bitnami/matomo:4.10.1

# We need to be root to do anything
USER 0

# We want RDS certs
COPY scripts/add-rds-cas.sh /usr/local/etc/add-rds-cas.sh

RUN /usr/local/etc/add-rds-cas.sh

# Switch back to non-root user
USER 1001

# Explicitly tell Apache to use port 8443
ENV APACHE_HTTPS_PORT_NUMBER=8443

RUN echo "Mutex posixsem" >> /opt/bitnami/apache2/conf/httpd.conf

# Expose port in the docker container
EXPOSE 8443
