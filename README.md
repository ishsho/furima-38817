# README


# テーブル設計

## usersテーブル

| Column                |  Type      |  Options                   |
|-----------------------|------------|----------------------------|
| nickname              | string     | nul:false                  |
| email                 | string     | nul:false, unique: true    |
| encrypted_password    | string     | nul:false                  |
| family_name_japanese  | string     | nul:false                  |
| first_name_japanese   | string     | nul:false                  |
| family_name_katakana  | string     | nul:false                  |
| first_name_katakana   | string     | nul:false                  |
| birthday              | date       | nul:false                  |


### Association

has_many :items
has_many :orders



## itemsテーブル

| Column                |  Type      |  Options                     |
|-----------------------|------------|------------------------------|
| item_name             | string     | nul:false                    |
| content               | text       | nul:false                    |
| category_id           | integer    | nul:false                    |
| state_id              | integer    | nul:false                    |
| load_id               | integer    | nul:false                    |
| area_id               | integer    | nul:false                    |
| date_id               | integer    | nul:false                    |
| price                 | string     | nul:false                    |
| user                  | references | nul:false, foreign_key: true |


### Association

has_one    :order
belongs_to :user



## ordersテーブル

| Column                |  Type      |  Options                     |
|-----------------------|------------|------------------------------|
| user                  | references | nul:false, foreign_key: true |
| item                  | references | nul:false, foreign_key: true |


### Association

belongs_to : user
belongs_to : item
has_one    : transact



## transactsテーブル

| Column                |  Type      |  Options                     |
|-----------------------|------------|------------------------------|
| postal_code           | string     | nul:false                    |
| area_id               | integer    | nul:false                    |
| municipalities        | string     | nul:false                    |
| adress                | string     | nul:false                    |
| building              | string     |                              |
| phone                 | integer    | nul:false                    |
| order                 | references | nul:false, foreign_key: true |


### Association

belongs_to :order