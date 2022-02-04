class RenameCourseIdToCategoryId < ActiveRecord::Migration[6.1]
  def change
    rename_column :idea_categories, :course_id, :category_id
  end
end
