class BookmarkPolicy < ApplicationPolicy
  def index?
    true
  end

  def update?
    create?
  end

  def edit?
    update?
  end

#commented out to be able to test delete button functioning
  def destroy?
    user.present? && (record.user == user)
  end
  
end