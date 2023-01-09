FROM ruby:2.6.5
# ベースにするイメージを指定

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs default-mysql-client vim
# RailsのインストールやMySQLへの接続に必要なパッケージをインストール

RUN mkdir /pictweet3
# コンテナ内に pictweet3ディレクトリを作成

WORKDIR /pictweet3
# 作成したmyappディレクトリを作業用ディレクトリとして設定

COPY Gemfile /pictweet3/Gemfile
COPY Gemfile.lock /pictweet3/Gemfile.lock
# ローカルの Gemfile と Gemfile.lock をコンテナ内のpictweet3配下にコピー

RUN bundle install
# コンテナ内にコピーした Gemfile の bundle install

COPY . /myapp
# ローカルのpictweet3配下のファイルをコンテナ内のmyapp配下にコピー
