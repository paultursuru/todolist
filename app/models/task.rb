class Task < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :deadline, presence: true

  enum status: [:todo, :done, :cancelled]
  enum priority: [:normal, :urgent, :very_urgent]
end
