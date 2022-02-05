class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :categories
  has_many :ideas, through: :idea_categories
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
