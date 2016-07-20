class RenewBody < ActiveRecord::Migration[5.0]
  def change
    remove_column :posts, :body
    add_column :posts, :body, :text
  end
end
