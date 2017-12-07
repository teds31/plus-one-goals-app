class AddGoalsId < ActiveRecord::Migration[5.1]
  def change
    add_column :tasks, :goal_id, :integer
  end
end
