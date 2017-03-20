class Vote < ApplicationRecord
	belongs_to :comment
	belongs_to :user
	
	def user_votes
		return self.votes.where("upvote = true").count - self.votes.where("downvote = true").size
	end

	def upvoted_by(user)
		vote = self.votes.where("user_id = ?", user.id).first
		if vote.nil?
			return false
		end
		return vote.upvote
	end

	def downvoted_by(user)
		vote = self.votes.where("user_id = ?", user.id).first
		if vote.nil?
			return false
		end
		return vote.downvote
	end

end
