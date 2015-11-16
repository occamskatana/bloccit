class SponsoredPostsController < ApplicationController
  def show
  	@sponsored_post = SponsoredPost.find(params[:id])
  end

  def new
  	@topic = Topic.find(params[:topic_id])
  	@sponsored_post = SponsoredPost.new
  end

  def edit
  	@sponsored_post = SponsoredPost.find(params[:id])
  end

  def create
  	@sponsored_post = SponsoredPost.new
  	@sponsored_post.title = params[:sponsored_post][:title]
  	@sponsored_post.body = params[:sponsored_post][:body]
    @sponsored_post.price = params[:sponsored_post][:price]
  	@topic = Topic.find(params[:topic_id])
  	@sponsored_post.topic = @topic

  	if @sponsored_post.save
  		flash[:notice] = "Post was saved"
  		redirect_to [@topic, @sponsored_post]

  	else

  		flash[:error] = "There was an error saving your post"
  		render :new
  	end
  end

  def update
  	@sponsored_post = SponsoredPost.find(params[:id])
  	@sponsored_post.title = params[:sponsored_post][:title]
  	@sponsored_post.body = params[:sponsored_post][:body]
    @sponsored_post.price = params[:sponsored_post][:price]
    
  	if @sponsored_post.save
  		flash[:notice] = "SponsoredPost was updated"
  		redirect_to [@sponsored_post.topic, @sponsored_post]
  	else
  		flash[:error] = "SponsoredPost was not updated, try again"
  		render :edit
  	end
  end

  def destroy
  	@sponsored_post = Post.find(params[:id])
  	if @post.destroy
  		flash[:notice] = "\"#{post.title}\" was deleted successfully"
  		redirect_to @sponsored_post.topic 
  	else
  		flash[:error] = "There was a problem deleting this post"
  		render :show
  	end
  end

end
