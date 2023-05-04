class AboutController < ApplicationController
  def index
    @orders = Order.all.length
    @items = LineItem.all.length
    @products = Product.all.length
  end
end
