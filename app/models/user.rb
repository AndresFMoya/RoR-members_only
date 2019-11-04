require "digest"

class User < ApplicationRecord
  attr_accessor :remember_token
  before_create :remember
  has_secure_password

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(string)
    Digest::SHA1.hexdigest string
  end

  def remember
    self.remember_token = User.new_token
    update(remember_digest: User.digest(remember_token))
  end
end
