class RenameTypeColumnOnInterviews < ActiveRecord::Migration[5.1]
  def change
    rename_column :interviews , :type, :interview_type
  end
end
