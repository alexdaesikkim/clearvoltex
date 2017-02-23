class Song < ApplicationRecord
	has_many :difficulties

	validates :song_name, presence: true
	validates :artist, presence: true

end
