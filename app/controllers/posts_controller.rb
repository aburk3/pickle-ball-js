class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destory]

  def show
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.all
  end

  def liked
    @liked = []
    current_user.likes.each do |post|
      @liked << post.post
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    current_user.posts << @post
    if @post.save
      @post.save
      redirect_to post_path(@post), notice: "Post was successfully created."
    else
      redirect_to new_post_path, notice: "Failed to create post."
    end
  end

  def edit
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post), notice: "Update Successful."
    else
      redirect_to post_path(@post), notice: "Failed to Update."
    end
  end

  def add_category
    @post = Post.find(params[:id])
    @post.categories << Category.find(params[:category_id])
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :category)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
