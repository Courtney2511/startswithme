class DropColumnsFromUser < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :password
    remove_column :users, :password_confirmation
    remove_column :users, :password_digest
  end
end
