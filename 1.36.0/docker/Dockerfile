FROM registry.redhat.io/openshift-serverless-1/logic-swf-builder-rhel8:1.36.0 AS builder

# variables that can be overridden by the builder
# To add a Quarkus extension to your application
ARG QUARKUS_EXTENSIONS
# Args to pass to the Quarkus CLI add extension command
ARG QUARKUS_ADD_EXTENSION_ARGS
# Additional java/mvn arguments to pass to the builder
ARG MAVEN_ARGS_APPEND

# Copy from build context to skeleton resources project
COPY --chown=1001 . ./resources

RUN /home/kogito/launch/build-app.sh ./resources

#=============================
# Runtime Run
#=============================
FROM registry.access.redhat.com/ubi9/openjdk-17-runtime:latest

ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en'

# We make four distinct layers so if there are application changes the library layers can be re-used
COPY --from=builder --chown=185 /home/kogito/serverless-workflow-project/target/quarkus-app/lib/ /deployments/lib/
COPY --from=builder --chown=185 /home/kogito/serverless-workflow-project/target/quarkus-app/*.jar /deployments/
COPY --from=builder --chown=185 /home/kogito/serverless-workflow-project/target/quarkus-app/app/ /deployments/app/
COPY --from=builder --chown=185 /home/kogito/serverless-workflow-project/target/quarkus-app/quarkus/ /deployments/quarkus/

EXPOSE 8080
USER 185
ENV AB_JOLOKIA_OFF=""
ENV JAVA_OPTS="-Dquarkus.http.host=0.0.0.0 -Djava.util.logging.manager=org.jboss.logmanager.LogManager"
ENV JAVA_APP_JAR="/deployments/quarkus-run.jar"
