class CreateJoinTableSkillApplication < ActiveRecord::Migration[5.1]
  def change
    create_join_table :skills, :applications do |t|
      t.index [:skill_id, :application_id]
      # t.index [:application_id, :skill_id]
    end
  end
end
