class FavoritesController < ApplicationController

	before_action :require_sign_in

	def create
		post = Post.find(params[:post_id])
		favorite = current_user.favorites.build(post: post)

		if favorite.save
			flash[:notice] = "Your favorite was saved"
		else
			flash[:error] = "There was a problem saving your favorite. Please try again"
		end

		redirect_to [post.topic, post]
	end

	def destroy
		post = Post.find(params[:post_id])
		favorite = current_user.favorites.find(params[:id])

		if favorite.destroy
			flash[:notice] = "Unfavorited"
		else
			flash[:error] = "Error Unfavoriting, try again."
		end
		redirect_to [post.topic, post]
	end
end
