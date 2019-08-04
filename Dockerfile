FROM ruby:2.6.3
ENV BUNDLER_VERSION 2.0.2
ENV APP_ROOT /home/myapp

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
 && echo 'deb https://dl.yarnpkg.com/debian/ stable main' | tee /etc/apt/sources.list.d/yarn.list \
 && apt-get update \
 && apt-get install -y \
    nodejs \
    yarn \
    postgresql-client \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*
RUN gem install bundler -v $BUNDLER_VERSION
RUN mkdir $APP_ROOT
WORKDIR $APP_ROOT

# Bundle install
COPY Gemfile $APP_ROOT/Gemfile
COPY Gemfile.lock $APP_ROOT/Gemfile.lock
RUN bundle install

# Yarn install
COPY package.json $APP_ROOT/package.json
COPY yarn.lock $APP_ROOT/yarn.lock
RUN yarn install

# Copy project files
COPY . $APP_ROOT

# Webpack build
RUN bundle exec rails webpacker:compile

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]

