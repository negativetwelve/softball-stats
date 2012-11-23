class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :first_name
      t.string :last_name
      t.integer :number
      t.integer :user_id

      t.timestamps
    end
    add_index :players, [:user_id, :created_at]
  end
end
