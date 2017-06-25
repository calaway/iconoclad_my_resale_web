class AddMyresalewebIdToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :myresaleweb_id, :string
    add_column :users, :myresaleweb_last_name, :string
  end
end
