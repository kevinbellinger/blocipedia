class User < ActiveRecord::Base
#    extend FriendlyId
 # friendly_id :name, use: :slugged

 # delegate :wikis, to: :collaborations

  has_many :wikis, through: :collaborations

  def collaborations
     Collaboration.where(user_id: id)
  end

   #def wikis
    # collaborations.wikis
     # Wiki.where( id: collaborations.pluck(:wiki_id) )
   #end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :wikis

  has_and_belongs_to_many :collaborated_wikis, class_name: "Wiki"

  mount_uploader :avatar, AvatarUploader

   def role?(base_role)
   role == base_role.to_s
 end
end
