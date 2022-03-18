# https://github.com/bitnami/bitnami-docker-matomo
FROM bitnami/matomo:4

# Change user to perform privileged actions
USER 0

# If we want to use cURL to download the plugin directly,
# we can install and use unzip here
# e.g.
# RUN install_packages unzip
# RUN curl -o PluginName.zip \
#     https://plugins.matomo.org/api/2.0/plugins/PluginName/download/latest \
#     && unzip PluginName.zip \
#     && rm PluginName.zip \
#     && mv PluginName /opt/bitnami/matomo/plugins

# # Allow to write in tmp directory
RUN mkdir -p /var/www/html/tmp \
    && chmod -R a+w /var/www/html/tmp 

# Copy plugin from the host to the container
RUN mkdir -p /opt/bitnami/matomo/plugins
COPY plugins/LogViewer /opt/bitnami/matomo/plugins/LogViewer
RUN chmod -R a+w /opt/bitnami/matomo/plugins

# Restore user permissions
USER 1001

EXPOSE 8080