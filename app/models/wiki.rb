class Wiki < ActiveRecord::Base

extend FriendlyId
  friendly_id :title, use: [:slugged, :history]
 
  def should_generate_new_friendly_id?
    new_record?
  end
 
# Commenting out while adding has_many_and_belongs_to 
    # has_many :users
     belongs_to :user

has_and_belongs_to_many :users
has_and_belongs_to_many :collaborators

default_scope { order('created_at DESC') }

end
