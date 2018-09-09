class User < ApplicationRecord


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

  has_many :articles, dependent: :destroy       
end

# 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