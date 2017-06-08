class Group < ApplicationRecord
  has_many :users, through: :members
  has_many :members
  validates :groupname, presence: true
end
