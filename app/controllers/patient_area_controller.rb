class PatientAreaController < ApplicationController
  before_action :authenticate_user!

  # def index
  #   if current_user.admin?
  #     @appointments = Appointment.all
  #   else
  #     @appointments = Appointment.where(user: current_user)
  #   end
  #   render "appointments/index"
  # end

  # def new
  # end

  # def create
  #   User.create(user_params)
  # end

  # private

  # def user_params
  #   params.require(:user).permit(:name, :email, :password)
  # end
end
