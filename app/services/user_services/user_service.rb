class UserServices::UserService
  def initialize(user)
    @user = user
  end

  def self.create_user
    puts "Usuário criado!"
  end
end
