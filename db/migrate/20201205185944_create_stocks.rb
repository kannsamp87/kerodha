class CreateStocks < ActiveRecord::Migration[5.0]
  def change
    create_table :stocks do |t|
      t.string :name
      t.string :identifier
      t.string :type
      t.decimal :base_price
      t.decimal :ltp
      t.decimal :high
      t.decimal :low
      t.decimal :open
      t.decimal :close
      t.boolean :delisted

      t.timestamps
    end
  end
end
