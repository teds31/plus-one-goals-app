class Goals < ActiveRecord::Migration[5.1]
  def change
    create_table :goals do |t|
      t.string :wish, null: false, default: ""
      t.string :outcome, null: false, default: ""
      t.string :obstacles, null: false, default: ""

      ## Rememberable
      t.datetime :remember_created_at

      t.timestamps null: false
    end

  end
end
