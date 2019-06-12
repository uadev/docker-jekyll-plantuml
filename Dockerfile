# vim:set ft=dockerfile:
FROM ruby:2.4-alpine

LABEL maintainer="Yuriy Voziy <yuretsz@gmail.com>"
    
# Add PlantUML
ENV PLANTUML_VERSION 1.2018.14
ENV LANG en_US.UTF-8
RUN apk add --no-cache bash openjdk8 graphviz ttf-droid ttf-droid-nonlatin curl \
    && mkdir /app \
    && curl -L https://sourceforge.net/projects/plantuml/files/plantuml.${PLANTUML_VERSION}.jar/download -o /app/plantuml.jar \
    && apk del curl
    
RUN printf '#!/bin/bash\n\njava -jar /app/plantuml.jar "$1" "$2"' > /usr/bin/plantuml \
    && chmod +x /usr/bin/plantuml
