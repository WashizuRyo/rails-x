# Rails X

Ruby on Rails で作る X クローンの土台です。

## Requirements

- Ruby 3.4.1
- Rails 8.1.4
- Bundler 2.6 以上
- PostgreSQL 14 以上
- RSpec 8

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

RuboCopはRubyファイルとERBテンプレート内のRubyコードを検査します。

```sh
bin/rails zeitwerk:check
bin/rubocop
bundle exec rspec
```

## Pull Request

PRを作成する際は、[PRテンプレート](.github/pull_request_template.md)に従って、概要・関連Issue・変更内容・テスト・その他の情報を記載してください。
