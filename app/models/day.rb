class Day < ApplicationRecord
  has_many :tasks
  has_many :chores, through: :tasks
  belongs_to :user

  before_create :assign_chores

  def assign_chores
    today = Date.today.strftime('%A').downcase
    self.chores = Chore.for_a_given_day(today)
  end
end
