class User < ApplicationRecord
  serialize :medical_conditions, Array
  has_many :sent_invites, class_name: "Invite", foreign_key: :user_one_id
  has_many :received_invites, class_name: "Invite", foreign_key: :user_two_id
  has_many :review
  has_many :activitie
  has_many :message
  has_many :bookmark
  has_many :match_user
  has_many :matche
  has_many :attendee
end
