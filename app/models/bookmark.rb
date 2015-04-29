class Bookmark < ActiveRecord::Base
  require 'embedly'
  require 'json'

  belongs_to :user
  belongs_to :topic
    #this line was throwing an error that it could not find association for topic in this model for the bookmark policy
    #has_one :user, through: :topic
    has_many :likes, dependent: :destroy
  
  validates :url, presence: true

  # before_save :set_title

  def display
    return @obj if defined?(@obj)
    embedly_api = Embedly::API.new :key => ENV['EMBEDLY_API_KEY']
    obj = embedly_api.oembed :url => url
    @obj = obj.first
  end
  
   # set title method that uses the display object to automatically set the title
  def set_title
    self.title = display.title
  end

end
