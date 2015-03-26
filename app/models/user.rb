class User < ActiveRecord::Base
  has_many :topics
  has_many :bookmarks, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_bookmarks, through: :likes, source: :bookmark

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  def pending_invite?
    invitation_created_at && !invitation_accepted_at
  end        

  def liked(bookmark)
    likes.where(bookmark_id: bookmark.id, user_id: id).first
  end

  scope :visible_to, -> (user) { user ? all : where(public: true) }

end
