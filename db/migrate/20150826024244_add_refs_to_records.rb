class AddRefsToRecords < ActiveRecord::Migration
  def change
    add_reference :records, :question, index: true, foreign_key: true
    add_reference :records, :team, index: true, foreign_key: true
  end
end
