FROM ruby:2.4
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /app
WORKDIR /app
ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
RUN bundle install
ADD . /app

# Configure an entry point, so we don't need to specify 
# "bundle exec" for each of our commands.
ENTRYPOINT ["bundle", "exec"]