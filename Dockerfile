FROM ruby:3.3

RUN apt-get update -qq && apt-get install -y --no-install-recommends \
    curl \
    libpq-dev \
    postgresql-client \
    node-gyp \
    pkg-config \
  && curl -fsSL https://deb.nodesource.com/setup_22.x | bash - \
  && apt-get install -y --no-install-recommends nodejs \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

RUN bin/rails tailwindcss:build

RUN SECRET_KEY_BASE_DUMMY=1 bin/rails assets:precompile

EXPOSE 3000

CMD bundle exec rails db:create db:migrate && bundle exec rails server -b 0.0.0.0
