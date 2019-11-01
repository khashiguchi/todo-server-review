class Todo < ApplicationRecord
    #validation
    validates :title, presence: true
    validates :detail, presence: true
    VALID_DATE_REGEX = /^\d{4}-\d{1,2}-\d{5}:\d{2}:\d{2}.\d{4}$/
    validates :date, presence: true, 
                     format:{with: VALID_DATE_REGEX}
end
