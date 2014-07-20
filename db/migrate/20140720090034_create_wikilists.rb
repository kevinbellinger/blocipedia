class CreateWikilists < ActiveRecord::Migration
  def change
    create_table :wikilists do |t|
      t.string :title

      t.timestamps
    end
  end
end
