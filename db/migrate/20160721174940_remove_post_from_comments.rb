class RemovePostFromComments < ActiveRecord::Migration[5.0]
  def change
    remove_column :comments, :post_id
  end
end
