class Difficulty < ApplicationRecord
	belongs_to :song
	has_many :userstats
end
