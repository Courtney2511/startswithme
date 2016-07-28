class AddLinkToPosts < ActiveRecord::Migration[5.0]
  def change
    if column_exists?(:posts, :link) == false
      add_column :posts, :link, :string
    end
  end
end
