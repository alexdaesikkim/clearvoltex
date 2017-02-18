class Userstat < ApplicationRecord
	belongs_to :user
	belongs_to :difficulty

	validates :clear, inclusion: { in: %w[not_played failed cleared excessive UC PUC], message: "Error: Invalid operation in Userstat"}

end
