# (c) goodprogrammer.ru

require 'openssl'

# Модель пользователя.
class User < ApplicationRecord

  ITERATIONS = 20_000
  DIGEST = OpenSSL::Digest::SHA256.new

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  VALID_USER_REGEX = /\A[\w]+\z/

  attr_accessor :password

  has_many :questions, dependent: :destroy

  before_save :encrypt_password

  validates :email, :username, presence: true
  validates :email, :username, uniqueness: true
  validates :password, presence: true, on: :create

  validates :username, length: { maximum: 40 }
  validates :email, format: { with: VALID_EMAIL_REGEX }
  validates :username, format: { with: VALID_USER_REGEX }

  validates :password, confirmation: true

  def encrypt_password
    if password.present?
      self.password_salt = User.hash_to_string(OpenSSL::Random.random_bytes(16))
      self.password_hash = User.hash_to_string(OpenSSL::PKCS5.pbkdf2_hmac(
          password, password_salt, ITERATIONS, DIGEST.length, DIGEST))
    end
  end

  def self.hash_to_string(password_hash)
    password_hash.unpack('H*')[0]
  end

  def self.authenticate(email, password)
    user = find_by(email: email)

    return nil unless user.present?

    hashed_password = User.hash_to_string(
      OpenSSL::PKCS5.pbkdf2_hmac(
        password, user.password_salt, ITERATIONS, DIGEST.length, DIGEST)
    )

    return unless user.password_hash == hashed_password
    user
  end
end
