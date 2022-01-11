class User < ApplicationRecord
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  validates :first_name, presence: true, length: {minimum: 3}, format: { with: /\A[a-zA-Z]+\z/, message: "can only include letters"}
  validates :last_name, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: "can only include letters"}

  has_many :categories

end
