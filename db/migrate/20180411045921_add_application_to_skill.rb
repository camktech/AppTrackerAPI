class AddApplicationToSkill < ActiveRecord::Migration[5.1]
  def change
    add_reference :skills, :application, foreign_key: true
  end
end
