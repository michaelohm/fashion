class CommentsController < ApplicationController
	def new
		@comment = Comment.new
	end

	def create
		@user = current_user
		@comment = @user.comments.create(comment_params)

		if current_user && @comment.save
			@post = Post.find(@comment.post_id)
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
		@comment = Comment.find(params[:id])
		@comment.destroy
	end

	private

	def comment_params
		params.require(:comment).permit(:content, :post_id)
	end

end