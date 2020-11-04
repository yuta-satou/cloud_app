# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions



# アプリケーション概要

## クラウドファンディングアプリ

### 接続先情報 https://crowdfuning-app.herokuapp.com/

### ID/Pass
 ID: admin
Pass: 2222

### テスト用アカウント等
支援用
メールアドレス: satou@gmail.com
パスワード: ssss1234

### 支援用カード情報
番号：4242424242424242
期限：3/24
セキュリティコード：123

プロジェクト作成用
メールアドレス名: yuta@gmail.com
パスワード: pppp1234


![トップ画像](https://gyazo.com/63af8c85f84866bcefc43ec10f11a7f4 "トップ画像")


# 動作確認方法
WebブラウザGoogle Chromeの最新版を利用してアクセスしてください。
ただしデプロイ等で接続できないタイミングもございます。その際は少し時間をおいてから接続してください。
接続先およびログイン情報については、上記の通りです。
同時に複数の方がログインしている場合に、ログインできない可能性があります。
テストアカウントでログイン→トップページからクラウドファンディングを始めるを押下→プロジェクト情報を入力→プロジェクト掲載
確認後、ログアウト処理をお願いします




# テーブル設計

## users テーブル

| Column            | Type   | Options     |
| ----------------- | ------ | ----------- |
| nickname          | string | null: false |
| email             | string | null: false |
| password          | string | null: false |
| family_name       | string | null: false |
| name              | string | null: false |
| family_name_kana  | string | null: false |
| name_kana         | string | null: false |
| birthdate         | date   | null: false |


### Association

- has_many :orders
- has_many :items

## items テーブル

| Column                  | Type       | Options                        |
| ----------------------- | ---------- | ------------------------------ |
| title                   | text       | null: false                    |
| sub_title               | text       | null: false                    |
| content                 | text       |                                |
| target_amount           | integer    | null: false                    |
| start_amount            | integer    | null: false                    |
| day                     | date       | null: false                    |
| remaining_days          | integer    | null: false                    |
| tag                     | integer    | null: false                    |
| user                    | references | null: false, foreign_key: true |

### Association

- has_one :order
- belongs_to :user
- belongs_to_active_hash :tag


## orders テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| items   | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user


