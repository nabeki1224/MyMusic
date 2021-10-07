class Post < ApplicationRecord
	belongs_to :end_user

	validates :tweet, presence: true
end
