class Idea < ApplicationRecord
  belongs_to :progress
  belongs_to :user
  validates :title, presence: { message: 'Cannot be blank' }
end
