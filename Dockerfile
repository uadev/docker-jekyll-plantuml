# vim:set ft=dockerfile:
FROM ruby:2.3

LABEL maintainer="Yuriy Voziy <yuretsz@gmail.com>"
    
# Add PlantUML
RUN apt-get update && apt-get install -y \
    plantuml \
    && rm -rf /var/lib/apt/lists/* \
    && gem install jekyll-plantuml
