class User < ApplicationRecord
	attr_accessor :remember_token

	before_save { self.email = email.downcase }
	before_save { self.username = username.downcase }
	has_many :userstats

	validates :username, presence: true, length: { in: 6..20 },
						 uniqueness: { case_sensitive: false }
	validates :email, presence: true, uniqueness: { case_sensitive: false }
	validates_format_of :email, :with => /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i, :message => "Invalid e-mail format"
	validates :display_name, presence: true, length: { maximum: 8 }
	validates :password, presence: true, length: { minimum: 8 }
	validates :password_confirmation, presence: true, length: { minimum: 8 }

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
