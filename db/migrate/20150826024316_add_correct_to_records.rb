class AddCorrectToRecords < ActiveRecord::Migration
  def change
    add_column :records, :correct, :boolean
  end
end
