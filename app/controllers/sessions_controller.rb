class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by email: params[:session][:email].downcase
    authenticate @user
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  private

  def authenticate user
    if user&.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me].eql?("1") ? remember(user) : forget(user)
      redirect_to root_path
    else
      flash.now[:danger] = t :invalid_email_password_combination
      render :new
    end
  end
end
