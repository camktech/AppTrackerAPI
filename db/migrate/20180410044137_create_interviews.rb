class CreateInterviews < ActiveRecord::Migration[5.1]
  def change
    create_table :interviews do |t|
      t.string :type
      t.string :interviewer
      t.datetime :date

      t.timestamps
    end
  end
end
