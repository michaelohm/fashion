class LikesController < ApplicationController
	def new
		@like = Like.new
	end

	def create
		@user = current_user
		@like = @user.likes.create(like_params)

		if current_user && @like.save
			@post = Post.find(@like.post_id)
			respond_to do |format|
				format.js
			end
		end
	end

	def edit
		@comment = Comment.find(params[:id])
		@post = Post.find(@comment.post_id)
	end

	def update
		@post = Post.find(params[:post_id])
		@comment = Comment.find(params[:id])
		@comment.update_attributes(comment_params)
		if current_user && @comment.save
			respond_to do |format|
				format.js
			end
		end
	end

	def destroy
		@like = current_user.likes.find_by_post_id(params[:post_id])
		@like.destroy
	end

	private

	def like_params
		params.require(:like).permit(:post_id)
	end

end