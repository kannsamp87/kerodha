class CreateWatchlists < ActiveRecord::Migration[5.0]
  def change
    create_table :watchlists do |t|
      t.integer :user_id
      t.integer :stock_id
      t.timestamps
    end
  end
end
