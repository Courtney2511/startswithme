class DropText < ActiveRecord::Migration[5.0]
  def up
    drop_table :texts
  end
end
