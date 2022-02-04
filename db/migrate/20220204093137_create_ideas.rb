class CreateIdeas < ActiveRecord::Migration[6.1]
  def change
    create_table :ideas do |t|
      t.string :title
      t.string :description
      t.string :status
      t.integer :user_id

      t.timestamps
    end
  end
end
