class User < ApplicationRecord
	before_save { self.email = email.downcase }
	has_many :userstats

	validates :username, presence: true, length: {maximum: 20},
						 uniqueness: { case_sensitive: false }
	validates :email, presence: true, uniqueness: { case_sensitive: false }
	validates :display_name, presence: true, length: {maximum: 8}
	validates :password, presence: true, length: { minimum: 6 }

	has_secure_password
end
