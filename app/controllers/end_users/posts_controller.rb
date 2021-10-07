class EndUsers::PostsController < ApplicationController
	def create
		@post = Post.new(post_params)
		@post.end_user_id = current_end_user.id
		if @post.save
			redirect_to posts_path
		else
			@posts = Post.all
			render :index
		end
	end

	def index
		@posts = current_end_user.posts
		current_end_user.followings.each do |following|
			@posts += following.posts
		end
		@posts = @posts.sort_by{|post| post.created_at}.reverse
	end

	def show
		@post = Post.find(params[:id])
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to posts_path
	end

	private
	def post_params
		params.require(:post).permit(:tweet)
	end
end
