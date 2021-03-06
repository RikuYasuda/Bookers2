class Book < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
  validates :body, length: { maximum: 200 }
  belongs_to :user

  has_many :favorites, dependent: :destroy
  def favorited_by?(user)
  favorites.where(user_id: user.id).exists?
  end
  has_many :comments, dependent: :destroy
end
