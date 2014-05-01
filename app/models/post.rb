class Post < ActiveRecord::Base
  belongs_to :section, inverse_of: :posts
  validates :title, presence: true
  validates :content, presence: true
end
