class Cart
  attr_reader :items

  def initialize
    @items = Array.new #an array of cart_item objects
  end
  
  def add_product(product)
    #curPro = @items.find{|item| item.product == product}
    #if curPro
     # curPro.increment_quantity
    #else
     # @items << CartItem.new(product)
    #end
    
    @items.each do |item|
      if item.product == product
        @curPro = item
      end
    end
    
    if @curPro != nil
      @curPro.increment_quantity
    else
      @items << CartItem.new(product)
    end
    
  end
    
  def total_price()
    price = 0
    @items.each do |item|
      price += item.price
    end
    price
  end
  
end
