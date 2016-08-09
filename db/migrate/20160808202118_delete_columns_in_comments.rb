class DeleteColumnsInComments < ActiveRecord::Migration[5.0]
  def change
    remove_column :comments, :video_id
  end
end
