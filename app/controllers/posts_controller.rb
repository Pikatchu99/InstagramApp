class PostsController < ApplicationController
  before_action :find_id, only: %i[show edit update destroy confirmed confirm]
  def index
    @posts = Post.where(publish:true)
    @user = User.all

  end

  def create
    post = Post.new(post_params)
    post.user_id = session[:user_id]
    post.update(publish:false)
    if post.valid?
      post.save
      redirect_to confirm_path(post.id)
    else
      @post = post
      render :new
    end
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def show
    @favorite = current_user.favorites.find_by(post_id: @post.id)
  end

  def update
    if @post.update(post_params)
      redirect_to confirm_path(@post.id), notice: "Mis a jour réussi"
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice:"Post supprimé!"
  end

  def confirm
  end

  def confirmed
    @post.update(publish:true)
    redirect_to posts_path, notice: "Post publier"
  end
  
  private
  def post_params
    params.require(:post).permit(:content, :image, :image_cache)
  end
  def find_id
    @post = Post.find(params[:id])
  end
end
