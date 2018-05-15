class RemoveResumeIdFromApplication < ActiveRecord::Migration[5.1]
  def change
    remove_column :applications, :resume_id, :integer
  end
end
