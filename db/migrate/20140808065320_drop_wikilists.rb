class DropWikilists < ActiveRecord::Migration
  def change
  drop_table :wikilists
  end
end
