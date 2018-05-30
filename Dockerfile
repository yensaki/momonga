FROM ruby:2.5.1

ENV APP_ROOT /usr/src/momonga

WORKDIR $APP_ROOT

RUN apt-get update -qq && \
    apt-get install -y \
      libpq-dev \
      mysql-client \
      --no-install-recommends
RUN rm -rf /var/lib/apt/lists/*

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
# Node.jsをインストール
RUN apt-get update && \
    apt-get install nodejs

RUN apt-get update && \
    apt-get install -y yarn

COPY Gemfile $APP_ROOT
COPY Gemfile.lock $APP_ROOT

RUN \
  echo 'gem: --no-document' >> ~/.gemrc && \
  cp ~/.gemrc /etc/gemrc && \
  chmod uog+r /etc/gemrc && \
  bundle config --global build.nokogiri --use-system-libraries && \
  bundle config --global jobs 4 && \
  bundle install && \
  rm -rf ~/.gem

RUN yarn install

EXPOSE 3000
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
