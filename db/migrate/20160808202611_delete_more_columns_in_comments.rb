class DeleteMoreColumnsInComments < ActiveRecord::Migration[5.0]
  def change
    remove_column :comments, :photo_id
    remove_column :comments, :text_id
  end
end
