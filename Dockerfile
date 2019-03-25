FROM ruby:2.6.0

ENV RAILS_ENV "production"


WORKDIR /usr/src/app
COPY Gemfile ./
RUN bundle install

COPY . .


# RUN bundle update --bundler
# RUN bundle exec rails assets:precompile RAILS_ENV=production
# RUN bash ./bin/start
