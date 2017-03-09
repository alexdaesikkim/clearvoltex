class Comment < ApplicationRecord

	belongs_to :user
	belongs_to :difficulty
	has_many :votes

	def user_votes
		return self.votes.where("upvote = true").count - self.votes.where("downvote = true").size
	end

end
