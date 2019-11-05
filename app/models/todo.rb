class Todo < ApplicationRecord
  MAX_TITLE_LIMIT = 100
  MAX_DETAIL_LIMIT = 1000

# validation
  validates :title, presence: true, length: { maximum: MAX_TITLE_LIMIT }
  validates :detail, length: { maximum: MAX_DETAIL_LIMIT }
end