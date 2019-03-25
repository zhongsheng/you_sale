# FROM ruby:2.6.0
FROM yousale_app

WORKDIR /usr/src/app
COPY sources.list /etc/apt/sources.list

RUN wget -O node.tar.xz "https://nodejs.org/dist/v10.15.3/node-v10.15.3-linux-x64.tar.xz"
RUN mkdir -p /usr/src/node
RUN tar xf node.tar.xz -C /usr/src/node --strip-components=1
RUN cp -r /usr/src/node/* /usr/
# RUN apt-get update -y && \
#   apt-get upgrade -y && \
#   apt-get install -y nodejs npm && \
#   apt-get clean && \
#   rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN npm install -g yarn npx

ENV RAILS_ENV "production"

RUN gem install bundler:2.0.1
RUN yarn --upgrade

COPY Gemfile ./
RUN bundle install

COPY . .


# RUN bundle update --bundler
# RUN bundle exec rails assets:precompile RAILS_ENV=production
# RUN bash ./bin/start
