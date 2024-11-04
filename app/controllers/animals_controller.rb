class AnimalsController < ApplicationController
  before_action :authenticate_user! # Devise method to ensure user is logged in
  before_action :verify_client_role # Custom method to ensure user is a client

  def new
    @animal = Animal.new
  end

  def create
    @animal = current_user.animals.build(animal_params) # Associa o animal ao usuário logado

    if @animal.save
      redirect_to @animal, notice: "Animal cadastrado com sucesso!"
    else
      render :new
    end
  end

  def show
    @animal = Animal.find(params[:id])
  end

  private

  def animal_params
    params.require(:animal).permit(:nome, :especie, :raca, :peso)
  end

  def verify_client_role
    redirect_to root_path, alert: "Acesso permitido apenas para clientes!" unless current_user.cliente?
  end
end
