class AddExperienceToApplicationSkills < ActiveRecord::Migration[5.1]
  def change
    add_column :application_skills, :experience, :integer
  end
end
