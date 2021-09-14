class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to new_session_path
      flash[:success] = "Welcome to Instagram Clone"
    else
      render :new
    end
  end
  def show
    @user = User.find(params[:id])
    @post = Post.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.skip_validations = true
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to user_path(params[:id])
    else
      render :edit
    end
  end
  def user_favorite
    @user = User.find(params[:id])
  end
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :profile_picture, :profile_picture_cache)
  end

end
