class UsersController < ApplicationController
  
  def new
    @user = User.new
  end
    
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id), notice:"ログインしてください"
    else
      render '/users/new'
    end
  end
    
  def show 
    @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(current_user.id)
    p @user
  end
  
  def update
    @user = User.find(params[:id])
    p @user
    if @user.update(update_user_params)
      redirect_to user_path, notice:'個人情報修正完了。'
    else
      render :edit  if @user.invalid?
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image)
  end
   
  def update_user_params
    params.require(:user).permit(:name, :password, :password_confirmation, :image)
  end
  
    
end
