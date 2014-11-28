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
  
  def checkout
    @cart = find_cart
    if @cart == nil
      flash[:notice] = 'Cannot checkout since your cart is empty.'
      redirect_to action:"index"
    else
      @order = Order.new
    end 
  end
  
  def save_order
    @cart = find_cart
    @order = Order.new(order_params)
    if @order.save
      session[:id] = @order.id
      flash[:notice] = 'Your order was saved successfully!'
      redirect_to action:"receipt"
    else
      flash[:notice] = 'Your order was not saved successfully. '
      redirect_to action:"index"
    end
  end
  
  def receipt
    @cart = find_cart
    @order = Order.find(session[:id])
  end
  
  def clear_out
    session[:id] = nil
    session[:cart] = nil
    flash[:notice] = 'Your order is completed!  Thank you!'
    redirect_to action:"index"
  end
  
  private
  def find_cart
    if session[:cart] == nil
      session[:cart] =  Cart.new
    end
    session[:cart]
  end
  
  def order_params
    params.require(:order).permit(:name, :address, :email, :pay_type)
  end
  
end
