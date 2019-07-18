class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update,:destroy]
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
    @photo = Photo.new(photo_params)
    if @photo.save
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
    render :new if @photo.invalid?
  end

  private

  def photo_params
    params.require(:photo).permit(:content,:image,:image_cache)
  end

  def set_photo
    @photo = Photo.find(params[:id])
  end
end
