class Dan < ApplicationRecord
	has_many :dan_stats
	has_many :dandifficulties

	def user_score(id)
		userstat = self.dan_stats.where(:user_id => id)
		if userstat.exists? && (!userstat.first.score.nil?)
			return userstat.first.score
		else
			return "not_played"
		end
	end

	def user_clear(id)
		userstat = self.dan_stats.where(:user_id => id)
		if userstat.exists?
			return userstat.first.clear
		else
			return "not_played"
		end
	end

	def song(num)
		case num
			when 2
				self.difficulties.where(:id => second_song_id)
			when 3
				self.difficulties.where(:id => third_song_id)
			else
				self.difficulties.where(:id => first_song_id)
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
