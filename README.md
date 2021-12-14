# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false, unique: true |
| email              | string  | null: false               |
| encrypted_password | string  | null: false               |
| first_name         | string  | null: false               |
| family_name        | string  | null: false               |
| first_name_kana    | string  | null: false               |
| family_name_kana   | string  | null: false               |
| birth_day          | date    | null: false               |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| item_name     | string     | null: false                    |
| price         | integer    | null: false                    |
| description   | string     | null: false                    |
| category_id   | integer    | null: false                    |
| condition_id  | integer    | null: false                    |
| ship_cost_id  | integer    | null: false                    |
| prefecture_id | integer    | null: false                    |
| ship_date_id  | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase

# purchases テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post_code     | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| address_line  | string     | null: false                    |
| building      | string     |                                |
| telephone     | string     | null: false                    |
| purchase      | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase