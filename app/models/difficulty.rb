class Difficulty < ApplicationRecord
	belongs_to :dan
	has_many :userstats
	has_many :comments
	has_many :dandifficulties

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

	def clear_rate
    	clear_count = self.userstats.where("clear != ? AND clear != ?", "not_played", "failed").count
    	userstat_count = self.userstats.where("clear != ?", "not_played").count

    	if userstat_count == 0
    		return "NO PLAY"
    	else
    		return (((clear_count * 1000)/(userstat_count)) / 10.0).to_s + "%"
    	end
	end

	def tag_to_string
		case self.difficulty_name
	        when "2"
	        	return "ADVANCE"
	        when "3"
	        	return "EXHAUST"
	        when "4"
	        	return "MAXIMUM"
	        when "5"
	        	return "INFINITE"
	        when "6"
	        	return "GRAVITY"
	        when "7"
	        	return "HEAVENLY"
	        else
	        	return "NOVICE"
	    end
	end
end
