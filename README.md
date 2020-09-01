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
| Column     | Type       | Options      |
|------------|-------------|--------------|
| nickname   | string      | null: false  |
| email  | string  | null: false, uniqueness: true       |
| user_password  | string | null: false, uniqueness: true   |
| family_name    | string     | null: false           |
| first_name       | string       | null: false       |
| family_name_kana    | string     | null: false      |
| first_name_kana | string   | null: false    |
| birth_day   | date     | null: false     |
### Association
* has_many :items
* has_one :card
* has_one :address


## purchasers
| Column     | Type       | Options      |
|------------|-------------|--------------|
| item   | references  | null: false, foreign_key: true  |
| user_id  | references | null: false, foreign_key: true  |
### Association
* has_one :item
* has_one :address
* belong_to :user



## Cards
| Column     | Type       | Options      |
|------------|-------------|--------------|
| user_id   | references | null: false, foreign_key: true  |
| purchaser_id | references | null: false, foreign_key: true |
| card_id  | integer | null: false, uniqueness: true   |
### Association
* belongs_to :user
* belongs_to :purchaser　


## Addresses
| Column     | Type       | Options      |
|------------|-------------|--------------|
| post_code   | string      | null: false  |
| prefecture | integer  | null: false, foreign_key: true |
| city  | string | null: false   |
| address    | string     | null: false     |
| building_name   | string   |        |
| phone_number  | string  | null: false, uniqueness: true |
| purchaser_id | references | null: false, foreign_key: true |
### Association
* belongs_to :purchaser

## Items
| Column     | Type       | Options      |
|------------|-------------|--------------|
| user_id   | references | null: false  |
| name | string  | null: false, foreign_key: true |
| description  | text | null: false   |
| image_id  | integer | null: false     |
| category_id   | integer |        |
| condition_id  | string | null: false, uniqueness: true |
| cost_id | string | null: false, foreign_key: true |
| prefecture_id | string | null: false, foreign_key: true |
| handling_time_id | integer | null: false, foreign_key: true |
| price | string | null: false, foreign_key: true |
### Association
* belongs_to :user
* belongs_to :purchaser
* has_many :images

## Images
| Column     | Type       | Options      |
|------------|-------------|--------------|
| image   | string      | null: false  |
| item_id | references | null: false, foreign_key: true  |
### Association



* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
