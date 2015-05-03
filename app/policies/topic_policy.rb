class TopicPolicy < ApplicationPolicy

  def update?
    user.present? && (record.user == user)
  end

  def destroy?
    update?
  end

  def edit?
    update?
  end  
end