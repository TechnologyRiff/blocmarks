class Topic < ActiveRecord::Base
  belongs_to :user
    has_many :bookmarks
    has_many :likes, dependent: :destroy
end
