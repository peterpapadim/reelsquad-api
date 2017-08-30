class List < ApplicationRecord
  has_many :user_lists
  has_many :users, through: :user_lists
  has_many :videos, dependent: :destroy
end
