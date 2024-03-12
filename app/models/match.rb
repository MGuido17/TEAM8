class Match < ApplicationRecord
  has_many :messages
  has_many :match_users
  has_many :users, through: :match_users
end
