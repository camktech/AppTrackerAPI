class AddApplicationToResume < ActiveRecord::Migration[5.1]
  def change
    add_reference :resumes, :application, foreign_key: true
  end
end
