class IdeaCategory < ApplicationRecord
  belongs_to :idea
  belongs_to :category
  has_many :ideas, through: :idea_categories
end
