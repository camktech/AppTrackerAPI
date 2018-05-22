class CreateApplicationSkills < ActiveRecord::Migration[5.1]
  def change
    create_table :application_skills do |t|
      t.references :application, foreign_key: true
      t.references :skill, foreign_key: true

      t.timestamps
    end
  end
end
