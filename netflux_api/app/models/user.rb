class User < ApplicationRecord
  has_many :subscriptions
  has_many :movies, through: :subscriptions
end
