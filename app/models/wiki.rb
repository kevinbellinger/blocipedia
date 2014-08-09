class Wiki < ActiveRecord::Base

  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]

  def should_generate_new_friendly_id?
    new_record?
  end

  def non_collaborators
    User.where.not(id: collaborators.pluck(:id))
  end


  # delegate :users, to: :collaborations

  has_many :users, through: :collaborations

  def collaborations
     Collaboration.where(wiki_id: id)
  end

   #def users
    # collaborations.users
     # User.where( id: collaborations.pluck(:user_id) )
  # end


  belongs_to :user

  has_and_belongs_to_many :collaborators, class_name: 'User'

  default_scope { order('created_at DESC') }

#Adding policies for view
scope :visible_to, -> (user) { user ? all : where(public: true) }

end
