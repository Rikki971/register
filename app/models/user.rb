class User < ApplicationRecord

	has_secure_password
	has_many :user_events, dependent: :destroy
    has_many :events
    has_many :comments, dependent: :destroy

	validates_uniqueness_of :email
end
