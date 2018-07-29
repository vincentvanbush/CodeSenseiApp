class Comment < ApplicationRecord
  belongs_to :article
  validates :commenter, presence: true, format: { with: /@/, message: 'should be a valid e-mail adress' }
  validates :body, presence: true, length: { minimum: 6, maximum:500 }
end
