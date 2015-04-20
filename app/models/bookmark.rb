class Bookmark < ActiveRecord::Base
  belongs_to :user
  belongs_to :topic
    #this line was throwing an error that it could not find association for topic in this model for the bookmark policy
    #has_one :user, through: :topic
    has_many :likes, dependent: :destroy
end
