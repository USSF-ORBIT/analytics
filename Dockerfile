# https://github.com/bitnami/bitnami-docker-matomo
FROM bitnami/matomo:4

# ## Change user to perform privileged actions
USER 0

# # Install system dependencies
# # RUN apt-get update && apt-get install -y unzip
# RUN install_packages unzip
# # Download, unzip and isntall EnvironmentVariables plugin
# RUN curl -o EnvironmentVariables.zip \
#     https://plugins.matomo.org/api/2.0/plugins/EnvironmentVariables/download/latest \
#     && unzip EnvironmentVariables.zip \
#     && rm EnvironmentVariables.zip \
#     && mv EnvironmentVariables /usr/src/matomo/plugins

# # Allow to write in tmp directory
RUN mkdir -p /var/www/html/tmp \
    && chmod -R a+w /var/www/html/tmp 
# && chmod -R a+w /var/www

# RUN mkdir -p /opt/bitnami/matomo/plugins \
#     && chmod -R a+w /opt/bitnami/matomo/plugins
# # USER 1001
# # Bring along our personalized Matomo config file

# COPY config/config.ini.php /bitnami/matomo/config/config.ini.php
# RUN chmod a+w /bitnami/matomo/config/config.ini.php
COPY plugins/LogViewer /opt/bitnami/matomo/plugins/LogViewer

# USER 1001
EXPOSE 8080