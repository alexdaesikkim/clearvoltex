class Userstat < ApplicationRecord
	belongs_to :user
	belongs_to :difficulty
end
