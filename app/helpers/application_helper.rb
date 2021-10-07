module ApplicationHelper
	def devise_mapping
   		@devise_mapping ||= Devise.mappings[:end_user]
	end
	def resource_name
	   :end_user
	end

	def resource
	   @resource ||= EndUser.new
	end
end
