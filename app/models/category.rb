class Category < ApplicationRecord
    belongs_to :user
    validates :user, presence: true, uniqueness: true
    validates :name, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: "can only include letters"}
    has_many :tasks
end
