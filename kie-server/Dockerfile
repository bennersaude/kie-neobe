#################################################################################
# Dockerfile that provides the image for JBoss KIE Server 7.17.0.Final Showcase
#################################################################################

####### BASE ############
FROM jboss/kie-server:7.23.0.Final

####### MAINTAINER ############
MAINTAINER "Leandro Alberto Lonardoni" "leandro.lonardoni@benner.com.br"

####### ENVIRONMENT ############
ENV KIE_SERVER_ID kie-server
ENV KIE_SERVER_LOCATION http://localhost:9090/kie-server/services/rest/server  
ENV KIE_SERVER_USER kieserver
ENV KIE_SERVER_PWD kieserver1!
# When using this image against jboss/jbpm-workbench-showcase use /jbpm-console/rest/controller
ENV KIE_SERVER_CONTROLLER http://localhost:8080/business-central/rest/controller
ENV KIE_SERVER_CONTROLLER_USER admin
ENV KIE_SERVER_CONTROLLER_PWD admin
ENV KIE_MAVEN_REPO http://localhost:8080/business-central/maven2    
ENV KIE_MAVEN_REPO_USER admin
ENV KIE_MAVEN_REPO_PASSWORD admin
ENV JAVA_OPTS -Xms256m -Xmx1024m -Djava.net.preferIPv4Stack=true -Dfile.encoding=UTF-8

####### Drools KIE Server CUSTOM CONFIGURATION ############
RUN mkdir -p $HOME/.m2
ADD etc/standalone.xml $JBOSS_HOME/standalone/configuration/standalone.xml
ADD etc/kie-server-users.properties $JBOSS_HOME/standalone/configuration/kie-server-users.properties
ADD etc/kie-server-roles.properties $JBOSS_HOME/standalone/configuration/kie-server-roles.properties
ADD etc/domain/host.xml $JBOSS_HOME/domain/configuration/host.xml
ADD etc/start_kie-server.sh $JBOSS_HOME/bin/start_kie-server.sh
ADD etc/update_db_config.sh $JBOSS_HOME/bin/update_db_config.sh
ADD etc/jbpm-postgres-config.cli $JBOSS_HOME/bin/jbpm-postgres-config.cli
ADD etc/jbpm-mysql-config.cli $JBOSS_HOME/bin/jbpm-mysql-config.cli
ADD etc/settings.xml $JBOSS_HOME/../.m2/settings.xml
COPY etc/add-ons/ $JBOSS_HOME/modules/system/add-ons/
COPY etc/drivers/ $JBOSS_HOME/bin/drivers/

# Added files are chowned to root user, change it to the jboss one.
USER root
RUN chown jboss:jboss $JBOSS_HOME/standalone/configuration/standalone.xml && \
chown jboss:jboss $JBOSS_HOME/standalone/configuration/kie-server-users.properties && \
chown jboss:jboss $JBOSS_HOME/standalone/configuration/kie-server-roles.properties && \
chown jboss:jboss $JBOSS_HOME/domain/configuration/host.xml && \
chown jboss:jboss $JBOSS_HOME/bin/update_db_config.sh && \
chown jboss:jboss $JBOSS_HOME/bin/start_kie-server.sh && \
chown jboss:jboss $JBOSS_HOME/../.m2/settings.xml
RUN chmod +x $JBOSS_HOME/bin/start_kie-server.sh
RUN chmod +x $JBOSS_HOME/bin/add-user.sh
RUN $JBOSS_HOME/bin/add-user.sh admin admin --silent

####### JBOSS USER ############
# Switchback to jboss user
USER jboss

####### RUNNING KIE-SERVER ############
WORKDIR $JBOSS_HOME/bin/
CMD ["./start_kie-server.sh"]
