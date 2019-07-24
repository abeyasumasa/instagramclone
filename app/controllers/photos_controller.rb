class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update,:destroy]
  before_action :ensure_correct_user,{only: [:edit, :update,:destroy]}
  def index
    @photos = Photo.all
  end

  def new
    if params[:back]
      @photo = Photo.new(photo_params)
    else
      @photo = Photo.new
    end
  end

  def create
    @photo = current_user.photos.build(photo_params)
    if @photo.save
      PhotoMailer.photo_mail(@photo).deliver
        redirect_to photos_path, notice: "ブログを作成しました！"
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @photo.update(photo_params)
      redirect_to photos_path, notice: "ブログを編集しました！"
    else
      render 'edit'
    end
  end

  def  destroy
    @photo.destroy
    redirect_to photos_path, notice:"ブログを削除しました！"
  end

  def confirm
    @photo = Photo.new(photo_params)
    @photo.user_id = current_user.id
    render :new if @photo.invalid?
  end

  private

  def photo_params
    params.require(:photo).permit(:content,:image,:image_cache,:user_id)
  end

  def set_photo
    @photo = Photo.find(params[:id])
  end

  def ensure_correct_user
    @user =Photo.find(params[:id])
      if current_user.id!=  @user.id
        flash[:notice] = "権限がありません"
        redirect_to photos_path
      end
  end
end
