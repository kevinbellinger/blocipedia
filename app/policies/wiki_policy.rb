class WikiPolicy < ApplicationPolicy

  def index?
    true
  end

  def create?
    user.present? 
  end

  def update?
    user.present? || collaborator.present?
  end


  def show?
    record.public? || user.present?
   #user.where(id: collaborators.pluck(:id))
 end

end