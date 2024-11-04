class User < ApplicationRecord
  has_many :animals, class_name: "Animal", foreign_key: "cliente_id", dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: { cliente: "cliente", admin: "admin" }

  validates :nome, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, confirmation: true

  def errors_full_messages
    errors.full_messages.map { |msg| msg.gsub(/(Email|Password confirmation)/, "").strip }.reject(&:empty?)
  end
end
