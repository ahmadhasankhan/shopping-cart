FROM ruby:2.7.0
MAINTAINER Ahmad Hassan

RUN apt-get update && apt-get install -y \
  build-essential \
  nodejs

RUN mkdir -p /app
WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN gem install bundler && bundle install --jobs 20 --retry 5
COPY . ./

# Expose port 3000 to the Docker host, so we can access it from the outside.
EXPOSE 3000

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
