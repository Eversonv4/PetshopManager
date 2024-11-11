class HomeController < ApplicationController
  def index
    @products = Product.limit(4)
  end

  def about_us
  end
end
