class PicturesController < ApplicationController
  before_action:checkSession, only: [:new, :edit, :show, :destroy, :list]
  
  before_action:set_pictures, only: [:destroy, :edit, :update, :show]
  
  def index
    @pictures = Picture.all
  end

  def new
    if params[:back]
      @pictures = Picture.new(pictures_params)  
    else
      @pictures = Picture.new
    end
  end

  def confirm
    @pictures = Picture.new(pictures_params)
    @pictures.user_id = current_user.id 
    p @pictures
    
  end

  def create
    @pictures = Picture.new(pictures_params)  
    @pictures.user_id = current_user.id
    if @pictures.user_id == current_user.id
      if @pictures.save
        #PictureMailer.picture_mail(@pictures).deliver
        redirect_to pictures_path
      else
        render 'new'
      end
    else
      flash[:notice] = "投稿権限がありません"
      redirect_to pictures_path  
    end
  end


  def show 
    p @pictures
    @favorite = current_user.favorites.find_by(picture_id: @pictures.id)
  end

  def destroy
    @pictures.destroy
    redirect_to pictures_path, notice: "insta削除完了。"
  end
  
  def edit
    p @pictures
  end
 
  def update
    p @pictures
    if @pictures.user_id == current_user.id
      if @pictures.update(pictures_params)
        redirect_to pictures_path, notice:'insta修正完了。'
      else
        render :edit  if @pictures.invalid?
      end 
    else
      flash[:notice] = "投稿編集の権限がありません"
      redirect_to pictures_path
    end
    
  end
  
  def list
    @favorites = Favorite.where(user_id: current_user.id)
    p @favorites
  end
  
  
  private
  
  def checkSession
    if !(session[:user_id])
      redirect_to new_session_path, notice:'loginしてください。'
    end 
  end
  
  def pictures_params
    params.require(:picture).permit(:content, :image, :image_cache)
  end

  def set_pictures 
    @pictures = Picture.find(params[:id])
  end

end
