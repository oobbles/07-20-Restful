class User < ActiveRecord::Base
  has_many :stories
  validates :email, presence: true
  validates :password, presence: true
end
