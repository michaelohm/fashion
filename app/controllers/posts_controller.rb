class PostsController < ApplicationController

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		@post.update_attributes(user_id: current_user.id)
		if @post.save
			redirect_to @post
		else
			render :new
		end
	end

	def show
		@post = Post.find(params[:id])
		@post.viewcount += 1
		@post.save
		@comment = Comment.new
		if user_signed_in?
			unless @like = current_user.likes.find_by_post_id(@post.id)
				@like = Like.new
			end
		end
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		@post = Post.update!(post_params)
		redirect_to post_path(@post)
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to root_path
	end

	private
	def post_params
		params.require(:post).permit(:title, :description, :photo)
	end

end