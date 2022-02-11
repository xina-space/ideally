class CreateIdeas < ActiveRecord::Migration[6.1]
  def change
    create_table :ideas do |t|
      t.belongs_to :progress, null: false, foreign_key: true

      t.timestamps
    end
  end
end
