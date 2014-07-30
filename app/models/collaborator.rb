class Collaborator < ActiveRecord::Base

belongs_to :wiki
belongs_to :user

#Not certain needed here - commenting out. 
 has_and_belongs_to_many :wikis
 has_and_belongs_to_many :users

end
