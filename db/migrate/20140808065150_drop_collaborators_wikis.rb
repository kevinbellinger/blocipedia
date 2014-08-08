class DropCollaboratorsWikis < ActiveRecord::Migration
  def change
    drop_table :collaborators_wikis
  end
end
