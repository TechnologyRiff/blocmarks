class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

         has_many :topics
         has_many :bookmarks, dependent: :destroy
         has_many :likes, dependent: :destroy
         has_many :bookmarks, through: :likes

  def bookmarks
    likes.bookmarks
  end
end
