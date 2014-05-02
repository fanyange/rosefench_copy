class User < ActiveRecord::Base
  before_save do
    self.email.downcase
    self.name.titlecase
  end
  validates :name, presence: true
  validates :name, format: { with: /\A[a-z][a-z0-9]+\s*\z/i }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

  has_secure_password

  def self.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def self.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end
end
