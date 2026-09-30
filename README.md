# Rails X

Ruby on Rails で作る X クローンの土台です。

## Requirements

- Ruby 3.4.1
- Rails 8.1.4
- Bundler 2.6 以上
- PostgreSQL 14 以上

データベースには PostgreSQL を使用します。Active Storage、Action Text、
Action Mailbox はまだ無効化しています。

ユーザー登録、ログイン、ログアウト、パスワード再設定には Devise を使用します。

## Setup

```sh
bundle install
bin/rails db:prepare
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
