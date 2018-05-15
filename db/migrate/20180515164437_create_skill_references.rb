class CreateSkillReferences < ActiveRecord::Migration[5.1]
  def change
    create_table :skill_references do |t|
      t.references :user, foreign_key: true
      t.references :application, foreign_key: true
      t.references :skill, foreign_key: true
      t.string :experience

      t.timestamps
    end
  end
end
