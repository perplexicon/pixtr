class Image < ActiveRecord::Base
  belongs_to :gallery
  has_many :comments
  has_and_belongs_to_many :groups
  has_many :likes
  has_many :user_likes, through: :likes, source: :user
  has_and_belongs_to_many :tags

  validates :name, presence: true
  validates :description, presence: true
  validates :url, presence: true
end
