class Admin::UsersController < ApplicationController
  before_action :authenticate_user! # Garante que o usuário esteja logado
  before_action :verify_admin_role # Garante que apenas admins possam acessar

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      redirect_to admin_users_path, notice: "Usuário criado com sucesso!"
    else
      render :new, alert: "Erro ao criar o usuário."
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :role, :nome, :telefone)
  end

  def verify_admin_role
    redirect_to root_path, alert: "Acesso permitido apenas para administradores!" unless current_user.admin?
  end
end
