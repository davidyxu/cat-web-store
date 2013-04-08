class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by_email(params[:user][:email])

    if !user.nil? && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to products_path
    else
      @user = User.new(:email => params[:user][:email])
      render :new
    end
  end

  def destroy
    reset_session
  end
end
