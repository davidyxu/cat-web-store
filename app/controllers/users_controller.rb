class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to new_session_url
    else
      render :new
    end
  end

  def show
  end

  #REV Doesn't look like you really need this users controller, most of this could be accomplished through sessions

end
