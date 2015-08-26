class AddMaxScoreToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :max_score, :integer
  end
end
