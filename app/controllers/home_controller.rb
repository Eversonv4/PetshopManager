class HomeController < ApplicationController
  def index
    user = current_user
    p user.inspect

    # flash[:notice] = "Welcome to the home page"
    # or
    # flash[:alert] = "Olha o alerta passando na sua porta"
  end

  def about_us
  end
end
