require 'embedly'
require 'json'
class Bookmark < ActiveRecord::Base
  belongs_to :user
  belongs_to :topic
    #this line was throwing an error that it could not find association for topic in this model for the bookmark policy
    #has_one :user, through: :topic
    has_many :likes, dependent: :destroy

  def display
    return @obj if defined?(@obj)
    embedly_api = Embedly::API.new :key => ENV['EMBEDLY_API_KEY']
    obj = embedly_api.oembed :url => url
    @obj = obj.first
  end

end
