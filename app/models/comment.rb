class Comment < ApplicationRecord

	belongs_to :user
	belongs_to :difficulty
	acts_as_votable

end
