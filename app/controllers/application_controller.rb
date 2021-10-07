class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?


    def after_sign_in_path_for(resource)
    	# logger.debug(current_end_user.to_yaml)
    	root_path
    end

    protected

	def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :name_kana, :telephone_number, :nickname, :birth_date, :sex])
    end

end