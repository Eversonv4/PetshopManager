class PatientAreaController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def new
  end

  def create
    User.create(user_params)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
