FROM ruby:2.6

RUN bundle config --global frozen 1


ENV RAILS_ENV "production"


WORKDIR /usr/src/app
COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .


RUN bundle exec rails assets:precompile RAILS_ENV=production
# RUN bash ./bin/start
