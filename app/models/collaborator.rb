class Collaborator < ActiveRecord::Base

belongs_to :user
belongs_to :wiki

#has_and_belongs_to_many :wikis
#has_and_belongs_to_many :users

end
