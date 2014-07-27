class Wiki < ActiveRecord::Base

extend FriendlyId
  friendly_id :title, use: [:slugged, :history]
 
  def should_generate_new_friendly_id?
    new_record?
  end
 
has_many :users
belongs_to :user

default_scope { order('created_at DESC') }

end
