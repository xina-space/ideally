class Progress < ApplicationRecord
  belongs_to :category
  has_many :ideas, dependent: :destroy
end
