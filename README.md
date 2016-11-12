# データベース設計
## テーブル
### messages
|Variable name|Variable Type|
|:---:|:---:|
|id|integer|
|text|text|
|image|text|
|user_id|integer|
|group_id|integer|
### users
|Variable name|Variable Type|
|:---:|:---:|
|id|integer|
|name|string|
|password|string|
|encrypted-password|string|
### groups
|Variable name|Variable Type|
|:---:|:---:|
|id|integer|
|name|string|
### group_users
|Variable name|Variable Type|
|:---:|:---:|
|id|integer|
|users_id|integer|
|groups_id|integer|
## アソシエーション
### messages
|Association|Table name|
|:---:|:---:|
|belongs_to|user|
|belongs_to|group|
### users
|Association|Table name|
|:---:|:---:|
|has_many|messages|
|has_many|groups(through group_users)|
### groups
|Association|Table name|
|:---:|:---:|
|has_many|messages|
|has_many|users(through group_users)|
### group_users
|Association|Table name|
|:---:|:---:|
|belongs_to|group|
|belongs_to|user|
