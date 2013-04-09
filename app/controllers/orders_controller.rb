class OrdersController < ApplicationController
  def create
    session[:cart].each do |product_id, quantity|
      Order.create!(:product_id => product_id,
                    :quantity => quantity,
                    :user_id => session[:user_id])
    end
    session[:cart] = Hash.new(0)
    flash[:order] = "You have placed your order! thank god we're getting rid of some of these cats."

    OrderMailer.order_confirmation(session[:user_id]).deliver

    redirect_to products_path
  end

  def show
    @orders = Order.where(:user_id => session[:user_id])
  end
end
