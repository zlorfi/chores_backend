class User < ApplicationRecord
  has_many :days, dependent: :destroy

  validates :user_name, presence: true
end
