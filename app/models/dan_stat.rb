class DanStat < ApplicationRecord
	belongs_to :user
	belongs_to :dan

	validates :clear, inclusion: { in: %w[dan_not_played dan_failed dan_cleared dan_UC dan_PUC], message: "Error: Invalid operation in Userstat"}
end
