FROM ruby:2.3.2

# 内部的にapt-get installが使われるので一緒にしとく
RUN apt-get update && \
    apt-get install -y \
        locales \
        fonts-vlgothic \
        --no-install-recommends && \
    gem install --no-ri --no-rdoc \
        bundler \
        pry \
        pry-byebug \
        rabbit && \
    rm -rf /var/lib/apt/lists/*

RUN echo "ja_JP.UTF-8 UTF-8" > /etc/locale.gen \
    && locale-gen \
    && update-locale LANG=ja_JP.UTF-8

ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:en
ENV LC_ALL ja_JP.UTF-8

WORKDIR /var/ruby

CMD ["bash"]
