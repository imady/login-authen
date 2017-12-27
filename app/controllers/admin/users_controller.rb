class Admin::UsersController < Admin::ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
       flash[:notice] = 'Created'
       redirect_to admin_users_path
    else
      flash[:notice] = 'not Created'
      render 'new'
    end
  end

  def show
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "User Delete"
    redirect_to admin_users_path

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to admin_users_path
  end

  private
  def user_params
    params.require(:user).permit(:name,:email,:password)
  end

end