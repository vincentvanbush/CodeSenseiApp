class Article < ApplicationRecord
  enum article_type: [ :normal, :sponsored ]

  has_many :comments, dependent: :destroy
  belongs_to :user

  validates :title, presence: true, length: { minimum: 5, maximum: 20 }
  validates :text, presence: true
end
