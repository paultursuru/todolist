class Task < ApplicationRecord
  belongs_to :user
  acts_as_list

  has_many :comments, dependent: :destroy

  validates :title, presence: true

  enum status: [:todo, :done, :cancelled]
  enum priority: [:normal, :urgent, :very_urgent]

  # PRIORITIES = ["normal", "urgent", "very urgent"]


  before_create :set_deadline, if: :deadline_nil_or_past

  def deadline_nil_or_past
    self.deadline == nil || self.deadline < Date.today
  end

  private

  def set_deadline
    self.deadline = Date.today
  end
end
