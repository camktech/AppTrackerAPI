class AddResumeToApplication < ActiveRecord::Migration[5.1]
  def change
    add_reference :applications, :resume, foreign_key: true
  end
end
