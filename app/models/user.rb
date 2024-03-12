class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :email, presence: true
  validates :age, numericality: { greater_than: 16, messsage: "You must to be over 16" }
  validates :first_name, presence: true
  validates :last_name, presence: true
  has_many :sent_invites, class_name: "Invite", foreign_key: :user_one_id
  has_many :received_invites, class_name: "Invite", foreign_key: :user_two_id
  has_many :match_user
  has_many :reviews
  has_many :activities, dependent: :destroy
  has_many :messages
  has_many :bookmarks
  has_many :attendees
  has_one :profile, dependent: :destroy
  has_many :invites
end
