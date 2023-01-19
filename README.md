# README


# テーブル設計

## usersテーブル

| Column                |  Type      |  Options                   |
|-----------------------|------------|----------------------------|
| nickname              | string     | null: false                 |
| email                 | string     | null: false, unique: true   |
| encrypted_password    | string     | null: false                 |
| family_name_japanese  | string     | null: false                 |
| first_name_japanese   | string     | null: false                 |
| family_name_katakana  | string     | null: false                 |
| first_name_katakana   | string     | null: false                 |
| birthday              | date       | null: false                 |


### Association

has_many :items
has_many :orders



## itemsテーブル

| Column                |  Type      |  Options                      |
|-----------------------|------------|-------------------------------|
| item_name             | string     | null: false                    |
| content               | text       | null: false                    |
| category_id           | integer    | null: false                    |
| state_id              | integer    | null: false                    |
| load_id               | integer    | null: false                    |
| area_id               | integer    | null: false                    |
| shipping_date_id      | integer    | null: false                    |
| price                 | integer    | null: false                    |
| user                  | references | null: false, foreign_key: true |


### Association

has_one    :order
belongs_to :user



## ordersテーブル

| Column                |  Type      |  Options                      |
|-----------------------|------------|-------------------------------|
| user                  | references | null: false, foreign_key: true |
| item                  | references | null: false, foreign_key: true |


### Association

belongs_to : user
belongs_to : item
has_one    : transact



## transactsテーブル

| Column                |  Type      |  Options                       |
|-----------------------|------------|--------------------------------|
| postal_code           | string     | null: false                    |
| area_id               | integer    | null: false                    |
| municipalities        | string     | null: false                    |
| adress                | string     | null: false                    |
| building              | string     |                                |
| phone                 | string     | null: false                    |
| order                 | references | null: false, foreign_key: true |


### Association

belongs_to :order