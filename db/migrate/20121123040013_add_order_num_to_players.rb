class AddOrderNumToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :order_num, :integer
  end
end
