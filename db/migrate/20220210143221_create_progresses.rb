class CreateProgresses < ActiveRecord::Migration[6.1]
  def change
    create_table :progresses do |t|
      t.belongs_to :category, null: false, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
