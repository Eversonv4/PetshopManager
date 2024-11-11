class ShopController < ApplicationController
  def index
    @products = Product.all
    render "products/index"
  end
end
