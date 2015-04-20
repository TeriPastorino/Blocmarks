class Bookmark < ActiveRecord::Base
  #belongs_to :user
    has_one :user, through: :topic
    has_many :likes, dependent: :destroy
end
