class AddTitleToPosts < ActiveRecord::Migration[5.0]
  def change
    if column_exists?(:posts, :title) == false
      add_column :posts, :title, :string
    end
  end
end
