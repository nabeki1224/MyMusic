class Track < ApplicationRecord
	has_many :mylists, dependent: :destroy

	def listed_by?(end_user)
    	mylists.where(end_user_id: end_user.id).exists?
  	end
end
