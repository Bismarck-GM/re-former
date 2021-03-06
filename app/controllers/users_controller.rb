class UsersController < ApplicationController
  before_action :set_user, only: %i[edit update]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = 'User created successfully'
      redirect_to new_user_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @user.update user_params
      flash[:notice] = 'User updated successfully'
      redirect_to edit_user_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit :username, :email, :password
  end

  def set_user
    @user = User.find params[:id]
  end
end
