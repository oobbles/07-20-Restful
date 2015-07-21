class Article < ActiveRecord::Base
  belongs_to :users
  validates :title, presence: true
  validates :content, presence: true
end
