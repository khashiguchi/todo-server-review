class Todo < ApplicationRecord
# validation
  validates :title, presence: true, length: { maximum: 100 }
　validates :detail, length: { maximum: 1000 }
end　
