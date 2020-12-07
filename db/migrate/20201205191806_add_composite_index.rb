class AddCompositeIndex < ActiveRecord::Migration[5.0]
  def change
	add_index :stocks, [:type, :identifier], unique: true
  end
end
