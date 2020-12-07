class AddStocksUniqueIndex < ActiveRecord::Migration[5.0]
  def change
	remove_index :stocks, column: [:type, :identifier]    
	add_index :stocks, [:type, :identifier], unique: true
  end
end
