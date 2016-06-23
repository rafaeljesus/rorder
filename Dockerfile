FROM iron/ruby

ENV APP_NAME rorder

WORKDIR /usr/$APP_NAME

ADD . /usr/$APP_NAME

ENTRYPOINT ["bundle", "exec", "puma", "config.ru"]
