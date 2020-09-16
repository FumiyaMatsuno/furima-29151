# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization
# データベース設計

## Users
|種類        | Column     | Type       | Options      |
|-----------|------------|-------------|--------------|
|ニックネーム| nickname   | string      | null: false  |
|メールアドレス| email  | string  | null: false, uniqueness: true       |
|パスワード| password  | string  | null: false |
|苗字| family_name    | string     | null: false           |
|名前| first_name       | string       | null: false       |
|苗字（かな）| family_name_kana    | string     | null: false      |
|名前（かな）| first_name_kana | string   | null: false    |
|生年月日| birth_day   | date     | null: false     |
### Association
* has_many :items
* has_many :comments
* has_many :orders

## Items
|種類        | Column     | Type       | Options      |追記           |
|-----------|------------|-------------|--------------|--------------|
|画像|    |  | null: false  | ActiveStorage |
|商品名| name | string  | null: false ||
|商品説明| description  | text | null: false ||
|送料負担| postage_id | integer | null: false ||
|価格| price | integer | null: false||
|カテゴリー| category_id   | integer | null: false |Active_hash|
|発送までの日数| sipping_day_id | integer | null: false |Active_hash|
|状態| condition_id  | integer | null: false |Active_hash|
|発送元地域| prefecture_id | integer | null: false |Active_hash|
|販売状況| sold | boolean |||

|| user | references | null: false, foreign_key: true ||
### Association
* belongs_to :user
* has_one :order
* has_many :comments
* has_one_attached: image

## comments
|種類        | Column     | Type       | Options      |
|-----------|------------|-------------|--------------|
|コメント| comment   | string      | null: false  |
|ユーザー| user | references | null: false, foreign_key: true  |
|商品| item | references | null: false, foreign_key: true  |
### Association
* belongs_to :user
* belongs_to :item

## Orders
|種類| Column     | Type       | Options      |追記          |
|-----------|------------|-------------|--------------|-------------|
|郵便番号| post_code   | string      | null: false  ||
|地域| prefecture | integer  | null: false |Active_hash|
|市| city  | string | null: false   ||
|住所| address    | string     | null: false     ||
|建物名| building_name   | string   |        ||
|電話番号| phone_number  | string  | null: false ||

|商品| item   | references  | null: false, foreign_key: true  |
|ユーザー| user  | references | null: false, foreign_key: true  |
### Association
* belongs_to :user
* belongs_to :item





* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
