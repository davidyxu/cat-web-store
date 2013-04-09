class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by_email(params[:user][:email])

    if !user.nil? && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      session[:cart] = Hash.new(0)
      flash[:login] = "You have logged in to the premiere cat buying site."
      redirect_to products_path
    else
      @user = User.new(:email => params[:user][:email])
      # need to refactor to use error hash instead of flash
      flash.now[:error] = "Invalid login."
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to "/login"
  end

  def add_to_cart
    session[:cart] << params[:product_id]
    redirect_to products_path
  end

  #REV: Why is add_to_cart in the session controller, seems more like a products controller action.
end
