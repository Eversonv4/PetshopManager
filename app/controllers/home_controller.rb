class HomeController < ApplicationController
  def index
    user = current_user
    p user.inspect
  end

  def about_us
  end
end
