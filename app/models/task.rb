class Task < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :deadline, presence: true

  enum status: [:todo, :done, :cancelled]
  enum priority: [:normal, :urgent, :very_urgent]
end
