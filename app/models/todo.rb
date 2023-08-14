class Todo < ApplicationRecord
    validates :task, :is_completed, presence: true
end
