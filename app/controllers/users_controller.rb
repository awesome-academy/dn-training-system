class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]
  before_action :load_user, only: [:show, :destroy, :edit,
   :update, :correct_user]
  before_action :correct_user, only: [:edit, :update, :show]
  before_action :admin_user, only: [:destroy, :index, :create]

  def new
    @user = User.new
  end

  def show
    @user = User.find_by id: params[:id]
    return if @user.present?

    flash[:danger] = t :user_nil
    redirect_to root_path
  end

  def index
    @users = User.paginate page: params[:page],
                           per_page: Settings.user.page_size
  end

  def destroy
    name = @user.name
    if @user.destroy
      flash[:success] = t :success_destroy, user: name
    else
      flash[:message] = t :false_destroy, user: name
    end
    redirect_to users_path
  end

  def update
    if user_params["password"].blank?
      params[:user].delete "password"
      params[:user].delete "password_confirmation"
    end
    if @user.update user_params
      flash[:success] = t :success_update
      redirect_to @user
    else
      render :edit
    end
  end

  def edit; end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = t :success_create
      redirect_to @user
    else
      render :new
    end
  end

  private

  def logged_in_user
    return if logged_in?

    flash[:danger] = t :login_first
    redirect_to login_url
  end

  def user_params
    params.require(:user).permit :name, :email, :password_confirmation,
                                 :password,
                                 :address, :gender, :birthday
  end

  def load_user
    @user = User.find_by id: params[:id]
    return if @user.present?

    flash[:danger] = t :user_nil
    redirect_to root_path
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

  def correct_user
    redirect_to(root_url) unless current_user.admin? || current_user?(@user)
  end
end
