FROM ruby:latest

RUN mkdir src
WORKDIR src
COPY . .
RUN ruby -v
RUN echo $PATH
RUN gem list
RUN bundle show
RUN bundle install

EXPOSE 8080
CMD bundle exec passenger start
