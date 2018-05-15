class RemoveApplicationIdFromResume < ActiveRecord::Migration[5.1]
  def change
    remove_column :resumes, :application_id, :integer
  end
end
