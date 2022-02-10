class Category < ApplicationRecord
  has_many :idea_categories
  has_many :ideas, through: :idea_categories, dependent: :destroy # source: :idea, foreign_key: :category_id
  belongs_to :user
  validates :title, presence: { message: 'Cannot be blank' }
  accepts_nested_attributes_for :ideas
end
