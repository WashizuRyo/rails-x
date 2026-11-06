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

## IssueからPRまでの開発

Codex用のスキルを `.agents/skills/` に置いています。
GitHubを操作する環境では、GitHub CLI（`gh`）と対象リポジトリへの読み書き権限が必要です。

1. `create-issue` で要望を整理し、人がタイトル・本文を確認してIssueを作成します。
2. 人がIssueを指定して `implement-issue` を起動します。
3. エージェントが実装・検証・コミット・push・PR作成まで進めます。
4. 人がPRをレビューし、マージを判断します。

依頼例:

```text
$create-issue 投稿を作成できる機能のIssueを作りたい。本文は最大280文字。

$implement-issue #123 を実装してPRを作成してください。
```

Issue作成から実装を自動起動する仕組みは設けていません。
実装中に仕様上の重大な不明点が見つかった場合は人に確認します。
まずはこの2つのスキルで運用し、必要になったルールを追加します。

## PRタイトル・コミットメッセージ

PRタイトルとコミットメッセージは、先頭に変更内容に合ったprefixを付け、
`<prefix>: <変更内容>` の形式にします。

| prefix | 用途 |
| --- | --- |
| `feat` | 機能の追加 |
| `fix` | 不具合の修正 |
| `docs` | ドキュメントの変更 |
| `refactor` | 挙動を変えないコードの整理 |
| `test` | テストの追加・修正 |
| `perf` | パフォーマンスの改善 |
| `ci` | CIの設定変更 |
| `chore` | その他の保守作業 |

コミットメッセージは本文を含めて英語で書き、件名は `Add`、`Fix`、`Update` などの命令形で簡潔に記述します。

```text
feat: Add post creation
fix: Reject empty post bodies
docs: Document the issue workflow
```

PRは `.github/pull_request_template.md` に従って作成します。
