class AddSkillsMatchToApplications < ActiveRecord::Migration[5.1]
  def change
    add_column :applications, :skills_match, :integer
  end
end
