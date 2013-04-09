class CartsController < ApplicationController

  before_filter :require_login

  def show
    @cart = Hash.new
    @total = 0

    session[:cart].each do |product_id, quantity|
      current = Hash.new

      current_product = Product.find(product_id)

      current["name"] = current_product.name
      current["quantity"] = quantity
      current["price"] = current_product.to_dollars
      current["line_total"] = current["price"] * quantity

      @total += current["line_total"]
      @cart[product_id] = current
    end
  end

  def add
    session[:cart][params[:product_id]] += 1
    flash[:cart] = "Product #{Product.find(params[:product_id]).name} added to cart"
    redirect_to products_path
  end

  def remove
    session[:cart].delete(params[:product_id])
    flash[:cart] = "Product #{Product.find(params[:product_id]).name} removed from cart"
    redirect_to cart_path
  end

  def update
    session[:cart] = Hash.new(0)
    params[:cart].each do |product_id, quantity|
      session[:cart][product_id] = quantity.to_i if quantity.to_i > 0
    end
    flash[:cart] = "Cart updated."
    redirect_to cart_path
  end

  def destroy
    session[:cart] = Hash.new(0)
  end

  private

  def require_login
    unless session[:user_id]
      flash[:error] = "You must be logged in to access this section"
      redirect_to "/login"
    end
  end
end
