class Category < ApplicationRecord
  has_many :idea_categories, dependent: :destroy
  has_many :ideas, through: :idea_categories
  belongs_to :user
end
