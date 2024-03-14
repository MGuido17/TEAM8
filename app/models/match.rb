class Match < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :match_users, dependent: :destroy
  has_many :users, through: :match_users
end
