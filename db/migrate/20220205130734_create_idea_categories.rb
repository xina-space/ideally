class CreateIdeaCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :idea_categories do |t|
      t.references :idea, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
