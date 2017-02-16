class Userstat < ApplicationRecord
	belongs_to :user
	belongs_to :difficulty

	validates :clear, inclusion: { in: %w[not_played failed cleared excessive UC PUC], message: "Error: Invalid operation in Userstat"}

	CLEARS = ["failed", "cleared", "excessive", "UC", "PUC"]

	def update_clearstate
		clearstate = self.clear
		x = 0
		case clearstate
		when "failed"
			x = 1
		when "cleared"
			x = 2
		when "excessive"
			x = 3
		when "UC"
			x = 4
		else
			x = 0	
		end
		self.update_attribute(:clear, CLEARS[x])
	end
end
