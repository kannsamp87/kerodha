class CreateUserStocks < ActiveRecord::Migration[5.0]
  def change
    create_table :user_stocks do |t|
	t.integer :user_id
        t.integer :stock_id
	t.integer :quantity
	t.string :type
	t.decimal :average_price
	t.index [:user_id, :stock_id], unique: true
    end

    add_foreign_key :users, :stocks
    
  end
end
