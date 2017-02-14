class User < ApplicationRecord
	before_save { self.email = email.downcase }

	validates :username, presence: true, length: {maximum: 20},
						 uniqueness: { case_sensitive: false }
	validates :email, uniqueness: { case_sensitive: false }
	validates :display_name, presence: true, length: {maximum: 8}
	validates :password, presence: true, length: { minimum: 6 }

	has_secure_password
end
