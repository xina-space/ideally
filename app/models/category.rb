class Category < ApplicationRecord
  has_many :idea_categories, dependent: :destroy
  has_many :ideas, through: :idea_categories, source: :idea
  belongs_to :user
end
