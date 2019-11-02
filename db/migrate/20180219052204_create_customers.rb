class CreateCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.float :account_balance
      t.integer :active_items

      t.timestamps
    end
  end
end
