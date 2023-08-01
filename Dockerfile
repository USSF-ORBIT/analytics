FROM bitnami/matomo:4.11.0

# We need to be root to do anything
USER 0

# We want RDS certs
COPY scripts/add-rds-cas.sh /usr/local/etc/add-rds-cas.sh

RUN /usr/local/etc/add-rds-cas.sh

# Switch back to non-root user
# USER 1001
# The above command has been disabled as Matomo upgrades are not able to progress without root user

# Explicitly tell Apache to use port 8443 for HTTPS and 8080 for HTTP
ENV APACHE_HTTPS_PORT_NUMBER=8443
ENV APACHE_HTTP_PORT_NUMBER=8080

RUN echo "Mutex posixsem" >> /opt/bitnami/apache2/conf/httpd.conf

# Expose port in the docker container
EXPOSE 8443
# Expose 8080 because in prod we are putting Matomo behind a HTTPS enabled load balancer and GCDS/Akamai CDN.
# Matomo 4.14.1 started rejecting requests "(failed)net::ERR_CERT_AUTHORITY_INVALID" because the default cert is probably invalid,
# so we will switch to using HTTP locally and trust the load balancer HTTPS in Dev and Prod.
EXPOSE 8080
