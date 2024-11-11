class AppointmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_appointment, only: %i[ show edit update destroy ]
  before_action :set_users, only: [ :new, :create, :edit ]
  before_action :set_animals, only: [ :new, :create, :edit ], if: -> { current_user.admin? }

  # GET /appointments or /appointments.json
  def index
    @page_title = ""
    if current_user.admin?
      @appointments = Appointment.all
      @page_title = "Todos os agendamentos"
    else
      @appointments = Appointment.where(user: current_user)
      @page_title = "Meus agendamentos"
    end
  end

  # GET /appointments/1 or /appointments/1.json
  def show
  end

  # GET /appointments/new
  def new
    @appointment = Appointment.new
  end

  # GET /appointments/1/edit
  def edit
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.user = current_user unless current_user.admin?

    if @appointment.save
      redirect_to appointments_path, notice: "Agendamento criado com sucesso."
    else
      render :new
    end
  end

  def load_animals
    user = User.find(params[:user_id])
    animals = user.animals.select(:id, :nome) # Seleciona apenas o id e o nome dos animais

    render json: animals
  end

  # PATCH/PUT /appointments/1 or /appointments/1.json
  def update
    respond_to do |format|
      if @appointment.update(appointment_params)
        format.html { redirect_to @appointment, notice: "Appointment was successfully updated." }
        format.json { render :show, status: :ok, location: @appointment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appointments/1 or /appointments/1.json
  def destroy
    @appointment.destroy!

    respond_to do |format|
      format.html { redirect_to appointments_path, status: :see_other, notice: "Appointment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    def set_users
      # @users = User.all if current_user.admin?
      @users = User.all.where(role: "cliente") if current_user.admin?
    end

    def set_animals
      @animals = Animal.all
    end

    def appointment_params
      params.require(:appointment).permit(:user_id, :animal_id, :observacao, :aberto)
    end
end
