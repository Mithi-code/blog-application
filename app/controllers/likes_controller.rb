class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    new_like = current_user.likes.new(
      author_id: current_user.id,
      post_id: @post.id
    )
    if new_like.save
      flash[:success] = 'Like saved successfully'
      redirect_to "/users/#{@post.author_id}/posts/#{@post.id}", notice: 'Success!'
    else
      redirect_to "/users/#{@post.author_id}/posts/#{@post.id}", alert: 'Error occured!'
      flash.now[:error] = 'Like not saved'
    end
  end
end
