# DB設計

## users table


|   Column   |     Type    |              Options                |
|:----------:|:-----------:|:-----------------------------------:|
| name       | string      |index: true, null: false, unique:true|
| email      | string      |null:false                           |

### Association

* has_many:groups, through: members

* has_many:messages

* has_many:members


## message table


|   Column   |       Type      |            Options              |
|:----------:|:---------------:|:-------------------------------:|
| user_id    | references:user |foreign_key: true, index: true   |
| group_id   | references:group|foreign_key: true, index: true   |
| body       | text            |null:false                       |
| image      | string          |                                 |

### Association

* belongs_to:user

* belongs_to:group

## group table


|   Column   |     Type    |              Options                |
|:----------:|:-----------:|:-----------------------------------:|
| groupname  | string      |null:false                           |

### Association

* has_many :users, through: :members

* has_many:messages

* has_many:members


## members table


|   Column   |       Type      |            Options              |
|:----------:|:---------------:|:-------------------------------:|
| user_id    | references:user |foreign_key: true, index: true   |
| group_id   | references:group|foreign_key: true, index: true   |

### Association

* belongs_to:user

* belongs_to:group

