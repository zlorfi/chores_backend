class Chore < ApplicationRecord
  WEEK_DAYS = %w[monday tuesday wednesday thursday friday saturday sunday].freeze

  validates :title, presence: true
end
