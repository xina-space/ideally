class IdeaCategory < ApplicationRecord
  belongs_to :idea_id
  belongs_to :category_id
end
