class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :ensure_correct_user,{only: [:edit, :update]}
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to new_session_path
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(current_user.id) , notice: "ユーザー画像を編集しました！"
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation,:user_image)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def ensure_correct_user
    @user =User.find(params[:id])
      if current_user.id !=  @user.id
        flash[:notice] = "権限がありません"
        redirect_to photos_path
      end
  end

end
