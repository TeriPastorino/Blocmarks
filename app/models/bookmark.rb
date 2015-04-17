class Bookmark < ActiveRecord::Base
  belongs_to :user
    #has_one :user, through: :topic
end
