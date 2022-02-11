class Idea < ApplicationRecord
  belongs_to :progress
  has_rich_text :content
end
