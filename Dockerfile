FROM ruby:2.3.7

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
        && apt-get install -y nodejs

RUN apt-get update -yqq \
  && apt-get install -yqq --no-install-recommends \
  postgresql-client \
  nodejs \
  && apt-get -q clean \
  && rm -rf /var/lib/apt/lists

#Preinstall gems with native extensions
RUN gem install nokogiri -v "1.10.3"

WORKDIR /usr/src/app
COPY Gemfile* ./
RUN bundle install
COPY . .

EXPOSE 80

CMD script/start
