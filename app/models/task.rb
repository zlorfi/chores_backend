class Task < ApplicationRecord
  belongs_to :day
  belongs_to :chore
end
