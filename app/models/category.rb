class Category < ApplicationRecord
  has_many :progresses, dependent: :destroy
  has_many :ideas, through: :progresses, dependent: :destroy # source: :idea, foreign_key: :category_id
  belongs_to :user
  validates :title, presence: { message: 'Cannot be blank' }
  accepts_nested_attributes_for :ideas
end
