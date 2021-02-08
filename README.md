# テーブル設計

## usersテーブル

| Column             | Type   | options                  |
|--------------------| -------|------------------------- |
| nickname           | string | null: false              |
| email              | string | null: false,unique: true |
| encrypted_password | string | null: false              |
| first_name         | string | null: false              |
| last_name          | string | null: false              |
| first_name_kana    | string | null: false              |
| last_name_kana     | string | null: false              |
| birthday           | date   | null: false              |

### Association
- has_many :items
- has_many :transaction

## itemsテーブル

| Column           | Type          | options                        |
| ---------------- | ------------- | ------------------------------ |
| title            | string        | null: false                    |
| about            | text          | null: false                    |
| category_id      | integer       | null: false                    |
| status_id        | integer       | null: false                    |
| delivery_fee_id  | integer       | null: false                    |
| prefecture_id    | integer       | null: false                    |
| delivery_days_id | integer       | null: false                    |
| price            | integer       | null: false                    |
| user             | references    | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one : transaction

## transactionテーブル

| Column    | Type          | options                        |
| --------- | ------------- | ------------------------------ |
| user      | references    | null: false, foreign_key: true |
| item      | references    | null: false, foreign_key: true |

### Association
- belong_to :user
- belong_to :item
- has_one :profile

## profileテーブル
| Column           | Type          | options                        |
| ---------------- | ------------- | ------------------------------ |
| postal_code      | string        | null: false                    |
| prefecture_id    | integer       | null: false                    |
| city             | string        | null: false                    |
| house_number     | string        | null: false                    |
| building_name    | string        |                                |
| tel              | string        | null: false                    |
| transaction      | references    | null: false, foreign_key: true |

### Association
- belong_to :transaction
