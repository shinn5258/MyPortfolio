class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :destroy,]

  def index
    @posts = Post.all.order(created_at: :desc)
  end
  
  def show
    # @post = Post.find params[:id]
  end
  
  def add
    @post = Post.new
  end

  def create
    @post = Post.new post_params
    if @post.save
      redirect_to "/posts/index"
    else
      render '/posts/add'
    end
  end

  def edit
    # @post = Post.find params[:id]
    if request.patch?
      @post.update(post_params)
      redirect_to '/posts/index'
    end
  end

  def destroy
    # @post = Post.find params[:id]
    @post.destroy
    redirect_to("/posts/index")
  end

  private
  def post_params
    params.require(:post).permit(:title, :genre, :content)
  end

  private
  def set_post
    @post = Post.find params[:id]
  end

end
