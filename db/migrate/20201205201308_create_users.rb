class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :password_digest
      t.string :first_name
      t.string :last_name
      t.string :email
      t.boolean :is_verified
      t.boolean :deactivated

      t.timestamps
    end
  end
end
