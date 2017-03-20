class DanStat < ApplicationRecord
	belongs_to :user
	belongs_to :dan

	validates :clear, inclusion: { in: %w[not_played failed cleared excessive UC PUC], message: "Error: Invalid operation in Userstat"}
end
