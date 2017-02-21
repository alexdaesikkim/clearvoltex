class User < ApplicationRecord
	attr_accessor :remember_token

	before_save { self.email = email.downcase }
	before_save { self.username = username.downcase }
	has_many :userstats

	VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

	validates :username, presence: true, length: {maximum: 20},
						 uniqueness: { case_sensitive: false }
	validates :email, presence: true, uniqueness: { case_sensitive: false }
	validates :display_name, presence: true, length: {maximum: 8}
	validates :password, presence: true, length: { minimum: 6 }

	has_secure_password

	def User.digest(string)
		cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
		BCrypt::Password.create(string, cost: cost)
	end

	def User.new_token
		SecureRandom.urlsafe_base64
	end

	def remember
		self.remember_token = User.new_token
		update_attribute(:remember_digest, User.digest(remember_token))
	end

	def authenticated?(remember_token)
		return false if remember_digest.nil?
		BCrypt::Password.new(remember_digest).is_password?(remember_token)
	end

	def forget
		update_attribute(:remember_digest, nil)
	end
end
