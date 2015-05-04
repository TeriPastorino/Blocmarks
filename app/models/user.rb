class User < ActiveRecord::Base

  has_many :topics 
  has_many :bookmarks, dependent: :destroy
  # def liked_bookmarks
  #                      # Like.where(user_id: self.id).pluck(:bookmark_id)
  #   liked_bookmark_ids = likes.pluck(:bookmark_id)
  #   Bookmark.where(id: liked_bookmark_ids)
  # end
  has_many :liked_bookmarks, through: :likes, source: :bookmark
  has_many :likes, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  def admin?
    role == 'admin'
  end

  def liked(bookmark)
    likes.where(bookmark_id: bookmark.id).first
  end

end
