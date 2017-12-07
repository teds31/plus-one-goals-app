class Tasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :task, null: false, default: ""

      ## Rememberable
      t.datetime :remember_created_at

      t.timestamps null: false
    end
  end
end
