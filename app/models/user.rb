class User < ApplicationRecord
  has_many :days

  validates :user_name, presence: true
end
