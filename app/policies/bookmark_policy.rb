class BookmarkPolicy < ApplicationPolicy

  def update?
    user.present? && (record.user == user)
  end

#commented out to be able to test delete button functioning
  def destroy?
    user.present? && (record.user == user)
  end
  
end