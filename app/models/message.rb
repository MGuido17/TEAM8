class Messages < ApplicationRecord
  belongs_to :match_users
  belongs_to :user
end
