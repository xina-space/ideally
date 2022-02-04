class RenameStudentIdToIdeaId < ActiveRecord::Migration[6.1]
  def change
    rename_column :idea_categories, :student_id, :idea_id
  end
end
