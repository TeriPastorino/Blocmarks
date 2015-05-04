class Topic < ActiveRecord::Base
  belongs_to :user
    has_many :bookmarks, dependent: :destroy

    validates :title, presence: true
    default_scope { order "created_at DESC"}
end
