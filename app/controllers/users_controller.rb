class UsersController < ApplicationController
  before_filter :authenticate, :except => [:show, :new, :create]
  before_filter :correct_user, :only => [:edit, :update]
  before_filter :admin_user,   :only => :destroy
  
  def index
    @title = "All Users"
    @users = User.paginate(:page => params[:page])
  end
  
  def show
    @user = User.find(params[:id])
    @title = @user.name
    @microposts = @user.microposts.paginate(:page => params[:page])
  end
  
  def new
    @user = User.new
    @title = "Sign Up"
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to Mars! Here is your KOAD:"
      flash[:crazy] = "#{rand(1000000)+1} creepers"
      redirect_to @user
    else
      @title = "Sign Up"
      flash[:failure] = "Please try again."
      render "new"
    end
  end
  
  def edit
    @user = User.find(params[:id])
    @title = "Edit User"
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated."
      redirect_to @user
    else
      @title = "Edit User"
      flash[:failure] = "Please try again."
      render "edit"
    end
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "D-stroyed!!!"
    redirect_to users_url
  end
  
  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.following.paginate(:page => params[:page])
    render "show_follow"
  end
  
  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(:page => params[:page])
    render "show_follow"
  end
  private
  def authenticate
    deny_access unless signed_in?
  end
  
  def deny_access
    redirect_to(signin_path, :notice => "SIGN IN FIRST!!!")
  end
  
  def correct_user
    @user = User.find(params[:id])
    redirect_to(buttsize_path, :notice => "How big is yours?") unless current_user?(@user)
  end
  def admin_user
    redirect_to(buttsize_path, :notice => "Nice try!") unless current_user.admin?
  end
end
