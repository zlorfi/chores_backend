class Chore < ApplicationRecord
  WEEK_DAYS = %w[monday tuesday wednesday thursday friday saturday sunday].freeze

  has_many :manifests
  has_many :days, through: :manifests

  validates :title, presence: true

  scope(:for_a_given_day, ->(day) { where(day => true) })
end
