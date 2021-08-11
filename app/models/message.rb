class Message < ApplicationRecord
  belongs_to :user
  validates :body, presence: true
  scope :custom_dispay, -> { order(:created_at).last(15) }
end
