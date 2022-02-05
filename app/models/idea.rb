class Idea < ApplicationRecord
  belongs_to :category
  belongs_to :user
  validates :title, presence: { message: 'Cannot be blank' }
end
