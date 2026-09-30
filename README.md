# Rails X

Ruby on Rails で作る X クローンの土台です。

## Requirements

- Ruby 3.4.1
- Rails 8.1.4
- Bundler 2.6 以上

この段階ではデータベースは使いません。Active Record、Active Storage、
Action Text、Action Mailbox は無効化しています。

## Setup

```sh
bundle install
```

## Start

```sh
bin/rails server
```

ブラウザで <http://localhost:3000> を開いてください。

## Check

```sh
bin/rails zeitwerk:check
bin/rails test
```
