class Wiki < ActiveRecord::Base

extend FriendlyId
  friendly_id :title, use: [:slugged, :history]
 
  def should_generate_new_friendly_id?
    new_record?
  end

belongs_to :user

#Trying something different
#belongs_to :collaborator

has_and_belongs_to_many :users

default_scope { order('created_at DESC') }

#Adding policies for view
scope :visible_to, -> (user) { user ? all : where(public: true) }

end
