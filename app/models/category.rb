class Category < ApplicationRecord
    belongs_to :user
    validates :user, presence: true
    has_many :tasks
end
