# README

# テーブル設計

## users テーブル

| Column             | Type   | Options                        |
| ------------------ | ------ | ----------- ------------------ |
| email              | string | null: false, foreign_key: true |
| encrypted_password | string | null: false                    |
| name               | string | null: false                    |
| profile            | text   | null: false                    |
| occupation         | text   | null: false                    |
| position           | text   | null: false                    |
|

### Association

- has_many :room_users
- has_many :rooms, through: :room_users
- has_many :messages

## prototypes テーブル

| Column       | Type        | Options     |
| ------------ | ----------- | ----------- |
| title        | string      | null: false |
| catch_copy   | text        | null: false |
| concept      | text        | null: false |
| user         | references  | null: false |





## comments テーブル

| Column    | Type       | Options     |
| --------- | ---------- | ----------- |
| content   | text       | null: false,|                               |
| prototype | references | null: false,|
| user      | references | null: false,|

