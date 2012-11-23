class CreatePitches < ActiveRecord::Migration
  def change
    create_table :pitches do |t|
      t.integer :location
      t.string :label
      t.string :outcome
      t.integer :player_id

      t.timestamps
    end
    add_index :pitches, [:player_id, :created_at]
  end
end
