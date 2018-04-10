class CreateApplications < ActiveRecord::Migration[5.1]
  def change
    create_table :applications do |t|
      t.string :company_name
      t.string :position
      t.datetime :date

      t.timestamps
    end
  end
end
