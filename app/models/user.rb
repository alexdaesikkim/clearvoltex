class User < ApplicationRecord
	attr_accessor :remember_token

	before_save { self.email = email.downcase }
	before_save { self.username = username.downcase }
	has_many :userstats
	has_many :comments
	has_many :votes
	has_many :dan_stats

	validates :username, presence: true, length: { in: 6..20 },
						 uniqueness: { case_sensitive: false }
	validates :email, presence: true, uniqueness: { case_sensitive: false }
	validates_format_of :email, :with => /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i, :message => "Invalid e-mail format"
	validates :display_name, presence: true, length: { maximum: 8 }
	validates :password, presence: true, length: { minimum: 8 }, on: :create
	validates :password_confirmation, presence: true, length: { minimum: 8 }, on: :create

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

	def karma
		point = 0
		user_comments = self.comments
		user_comments.each do |comment|
			point += comment.get_upvotes.size - comment.get_downvotes.size
		end
		return point
	end

	def create_reset_digest
		self.reset_token = User.new_token
		update_attribute(:reset_digest, User.digest(reset_token))
		update_attribute(:reset_sent_at, Time.zone.now)
	end

	def send_password_reset_email
		ClearvoltexMailer.password_reset(self).deliver_now
	end

	ROLES = [['admin', :admin],['regular', :regular]]

    def role?(authorized_role)
      return false if role.nil?
      role.downcase.to_sym == authorized_role
    end

    def update_dan
    	highest_dan = self.dan_stats.where("clear != ? AND clear != ?", "dan_not_played", "dan_failed").joins(:dan).where("level <= 12").order("level DESC").first
    	if(highest_dan.nil?)
    		update_attribute(:dan, 0)
    	else
    		update_attribute(:dan, highest_dan.dan.level)
    	end
    end
end
