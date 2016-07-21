class SorceryCore < ActiveRecord::Migration
  def change
    add_column :users, :salt, :string
    add_column :users, :crypted_password, :string
  end

    add_index :users, :email # unique: true

end
