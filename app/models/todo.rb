class Todo < ApplicationRecord
    #validation
    validates :title, presence: true
    validates :detail, presence: true
    validates :date, presence: true
end
