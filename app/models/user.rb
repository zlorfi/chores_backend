class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :trackable

  has_many :days, dependent: :destroy
  validates :email, presence: true
  validates :email, uniqueness: true
end
