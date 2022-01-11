class User < ApplicationRecord
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  validates :first_name, presence: true, length: {minimum: 3}, format: { with: /\A[a-zA-Z]+\z/, message: "can only include letters"}
  validates :last_name, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: "can only include letters"}

  has_many :categories
  # def is_user_admin
  #   if authenticate_user! && current_user.admin
  #       return true
  #   end
  # end

  # def is_user_helper
  #     if authenticate_user! && current_user.helper
  #         return true
  #     end
  # end

   def admin?
      true if self.admin==true
      false
  end
end
