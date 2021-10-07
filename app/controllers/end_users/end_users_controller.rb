class EndUsers::EndUsersController < ApplicationController
	before_action :authenticate_end_user!
	def show
		@end_user = EndUser.find(params[:id])
		@follower = current_end_user.relationships.find_by(follow_id: @end_user.id)
	end

	def following
		@end_user = EndUser.find(params[:id])
		@end_user.followings.each do |following|
			@follower = current_end_user.relationships.find_by(follow_id: following.id)
		end
	end

	def follower
		@end_user = EndUser.find(params[:id])
		@end_user.followers.each do |follower|
			@follower = current_end_user.relationships.find_by(follow_id: follower.id)
		end
	end

	def edit
	end

	def update
		@end_user = current_end_user
		if @end_user.update(end_user_params)
			redirect_to end_user_path(@end_user)
		else
			render :edit
		end
	end



	def search
	    if params[:search].present?
	      @end_users = EndUser.where(['nickname LIKE ? OR name LIKE ? OR mysinger LIKE ?', "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%"])
	    elsif
	      @end_users = EndUser.none
	    end
	end


	private
	def end_user_params
		params.require(:end_user).permit(:name, :nickname, :telephone_number, :mysinger, :introduction)
	end
end
