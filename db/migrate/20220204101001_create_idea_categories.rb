class CreateIdeaCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :idea_categories do |t|
      # t.references :idea_id, null: false, foreign_key: true
      # t.references :category_id, null: false, foreign_key: true

      t.integer :idea_id
      t.integer :category_id

      t.timestamps
    end
  end
end
