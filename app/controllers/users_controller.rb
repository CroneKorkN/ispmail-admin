class UsersController < ApplicationController
  def new
    redirect_to new_domain_path, notice: "create a domain first" if Domain.all.empty?
    @user = User.new
    @domains = Domain.all
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to :users
    else
      render 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
    @domains = Domain.all
  end
  
  def update
    @user = User.find(params[:id])

    @user.user = user_params[:user]
    @user.domain_id = user_params[:domain_id]
    @user.password = user_params[:password] if user_params[:change_pw] == "1"
    #render text: user_params.inspect
    if @user.save
      redirect_to :users
    else
      render :edit
    end
  end

  def index
    @users = User.all
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to :users
  end
  
  private
    def user_params
      params.require(:user).permit(:user,:password,:domain_id,:change_pw)
    end
end
