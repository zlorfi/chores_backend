class Day < ApplicationRecord
  has_many :tasks, dependent: :destroy
  has_many :chores, through: :tasks
  belongs_to :user

  before_create :assign_chores

  scope :summary_last_week, lambda { |current_user|
    Date.today.downto(Date.today - 7).to_a.each_with_object([]) do |day, array|
      record = find_by(user: current_user, created_at: day)
      next unless record

      array << {
        date: record.created_at,
        done: record.tasks.map(&:done).count(true),
        sum: record.tasks.count
      }
    end
  }

  def assign_chores
    today = Date.today.strftime('%A').downcase
    self.chores = Chore.for_a_given_day(today)
  end
end
