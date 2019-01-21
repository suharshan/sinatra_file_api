FROM ruby:2.2

RUN apt-get update -qq && apt-get install -y build-essential

ENV APP_HOME /file_api
RUN mkdir -p $APP_HOME/static/files
WORKDIR $APP_HOME

ADD Gemfile* $APP_HOME/
RUN bundle install

ADD . $APP_HOME

CMD shotgun -o 0.0.0.0
