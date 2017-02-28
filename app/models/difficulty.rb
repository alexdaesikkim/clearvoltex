class Difficulty < ApplicationRecord
	belongs_to :song
	has_many :userstats

	def user_score(id)
		userstat = self.userstats.where(:user_id => id)
		if userstat.exists? && (!userstat.first.score.nil?)
			return userstat.first.score
		else
			return "not_played"
		end
	end

	def user_clear(id)
		userstat = self.userstats.where(:user_id => id)
		if userstat.exists?
			return userstat.first.clear
		else
			return "not_played"
		end
	end

	def tag_to_int
		x = 0
		case self.difficulty_tag
	        when "adv"
	        	x = 2
	        when "exh"
	        	x = 3
	        when "mxm"
	        	x = 4
	        when "inf"
	        	x = 5
	        when "grv"
	        	x = 6
	        when "hvn"
	        	x = 7
	        else
	          x = 1
    	end
    	return x
	end
end
