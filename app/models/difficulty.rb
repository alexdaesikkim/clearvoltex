class Difficulty < ApplicationRecord
	belongs_to :song
	has_many :userstats

	def user_clear(id)
		userstat = self.userstats.where(:user_id => id)
		if userstat.exists?
			return userstat.first.clear
		else
			return "not_played"
		end
	end
end
