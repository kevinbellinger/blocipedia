class Wiki < ActiveRecord::Base

has_many :users
belongs_to :user

default_scope { order('created_at DESC') }

end
