class Movie < ApplicationRecord
  has_many :subscriptions
  has_many :users, through: :subscriptions
end
