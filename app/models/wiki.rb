class Wiki < ActiveRecord::Base

  belongs_to :user
  belongs_to :wikilist


end
