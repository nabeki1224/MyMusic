class Relationship < ApplicationRecord
	belongs_to :end_user
	belongs_to :follow, class_name: 'EndUser'

	validates :end_user_id, presence: true
	validates :follow_id, presence: true
end
