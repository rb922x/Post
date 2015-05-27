class PostController < ApplicationController
  def index
    @post = Post.all
  end
  def show
    @post = Post.find(params[:id])
  end
  def new
    @post = Post.new
  end
  def create
    @post = Post.new(user_params)
    if @post.save
     redirect_to post_index_path, :notice => "your post is saved"
    else
      render "new"
    end
  end
  def edit
    @post = Post.find(params[:id])
  end
  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(user_params)
     redirect_to post_index_path, :notice => "your post has been udapted"
    else
      render "edit"
    end
  end
  def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to post_index_path, :notice => "Your post has been deleted successfully."
  end  
  def user_params
    params.require(:post).permit(:title, :content)
  end
end
