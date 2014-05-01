class Section < ActiveRecord::Base
  has_many :posts, dependent: :destroy, inverse_of: :section
end
