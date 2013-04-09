class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by_email(params[:user][:email])

    if !user.nil? && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      session[:cart] = Hash.new(0) #REV Good idea using the session cart.
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
    reset_session #REV can't seem to find this method. 
    redirect_to "/login"
  end

  def add_to_cart
    session[:cart] << params[:product_id]
    redirect_to products_path
  end
end
