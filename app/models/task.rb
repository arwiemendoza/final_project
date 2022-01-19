class Task < ApplicationRecord
    belongs_to :category

    validates :name, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: "can only include letters"}
    validates :details, presence: true
    validates :date, presence: true
    validates :hourly_rate, presence: true
     
end
