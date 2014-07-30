class CreateCollaborators < ActiveRecord::Migration
  def change
    create_table :collaborators do |t|
      t.belongs_to :user
      t.belongs_to :wiki
    end
  end
end
