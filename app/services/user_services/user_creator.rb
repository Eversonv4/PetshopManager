class UserServices::UserCreator
  def initialize(name, email)
    @name = name
    @email = email
  end

  def create
    user = User.new(name: @name, email: @email)

    if user.save
      puts "Usuário criado com sucesso!"
      user
    else
      puts "Erro ao criar usuário!"
      false
    end
  end
end
