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
				return Difficulty.where(:id => second_song_id).first.photo
			when 3
				return Difficulty.where(:id => third_song_id).first.photo
			else
				return Difficulty.where(:id => first_song_id).first.photo
		end
	end
end
