class AddApplicationToInterview < ActiveRecord::Migration[5.1]
  def change
    add_reference :interviews, :application, foreign_key: true
  end
end
