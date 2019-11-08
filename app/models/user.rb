# frozen_string_literal: true

require 'digest'

class User < ApplicationRecord
  attr_accessor :remember_token
  has_secure_password
  has_many :posts

  # Returns the hash digest of the given string.
  def self.digest(string)
    Digest::SHA1.hexdigest(string)
  end

  # Returns a random token.
  def self.new_token
    SecureRandom.urlsafe_base64
  end

  # Remembers a user in the database for use in persistent sessions.
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def authenticated?(remember_token)
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def forget
    update_attribute(:remember_digest, nil)
  end
end
