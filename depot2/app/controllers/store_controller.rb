class StoreController < ApplicationController
  attr_accessor :cart
  def index
    @products = Product.all
  end
  
  def add_to_cart
    @cart = find_cart
    @product = Product.find(params[:id])  
    @cart.add_product(@product)
  end
  
  def empty_cart
    session[:cart] = nil
    flash[:notice] = 'You cart is empty.'
    redirect_to action:"index"
  end
  
  private
  def find_cart
    if session[:cart] == nil
      session[:cart] =  Cart.new
    end
    session[:cart]
  end
  
  
  
end
