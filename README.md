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


|   Column   |     Type    |              Options                |
|:----------:|:-----------:|:-----------------------------------:|
| user_id    | integer     |foreign_key: true                    |
| group_id   | integer     |                                     |
| body       | text        |                                     |
| image      | string      |                                     |

### Association

* belongs_to:user

* belongs_to:group

## group table


|   Column   |     Type    |              Options                |
|:----------:|:-----------:|:-----------------------------------:|
| groupname  | string      |                                     |

### Association

* has_many :users, through: :members

* has_many:messages

* has_many:members


## members table


|   Column   |     Type    |              Options                |
|:----------:|:-----------:|:-----------------------------------:|
| group_id   | integer     |                                     |
| user_id    | integer     |                                     |

### Association

* belongs_to:user

* belongs_to:group

