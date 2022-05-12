class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.page(params[:page])
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.author
    @comments = @post.comments
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    respond_to do |format|
      format.html do
        if @post.save
          flash[:notice] = 'Post created successfully.'
          redirect_to "/users/#{@post.author.id}/posts/"
        else
          flash[:notice] = 'Post creation failed. Try again'
          render :new
        end
      end
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
