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
			  format.js {render inline: "location.reload();" }
			end
		end
	end

	def destroy
		@like = current_user.likes.find_by_post_id(params[:post_id])
		@like.destroy
			respond_to do |format|
			  format.js {render inline: "location.reload();" }
			end
	end

	private

	def like_params
		params.require(:like).permit(:post_id)
	end

end