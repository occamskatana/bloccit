class Api::V1::PostsController < Api::V1::BaseController


	def create
		post = Post.new(post_params)

		if post.valid?
			post.save!
			render json: post.to_json, status: 201
		else
			render json: {error: "Post is invalid", status: 400}, status: 400
		end
	end

	def update
		post = Post.find(params[:id])

		if post.update_attributes(post_params)
			render json: post.to_json, status: 200
		else
			render json: {error: "Post is invalid", status: 400}, status: 400
		end
	end

	def destroy
		post = Post.find(params[:id])

		if post.destroy
			render json: {message: "Post has been destroyed", status: 200}, status: 200
		else
			render json: {message: "There was a problem destroying your post", status: 200}, status: 200
		end
	end

	private

	def post_params
		params.require(:post).permit(:title, :body)
	end

end