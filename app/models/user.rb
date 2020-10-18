require 'openssl'

# Модель пользователя.
class User < ApplicationRecord
  ITERATIONS = 20_000
  DIGEST = OpenSSL::Digest::SHA256.new

  VALID_USERNAME_REGEX = /\A\w+\z/
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  VALID_COLOR_REGEX = /\A#(?:[0-9a-fA-F]{3}){1,2}\z/i

  attr_accessor :password

  has_many :questions, dependent: :destroy
  
  before_validation :username_to_downcase, :email_to_downcase
  before_save :encrypt_password

  validates :username, presence: true, length: {maximum: 40}, format: {with: VALID_USERNAME_REGEX}
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}
  validates :email, :username, uniqueness: true
  validates :password, presence: true, on: :create

  validates :password, confirmation: true

  validates :color, format: {with: VALID_COLOR_REGEX}

  def self.authenticate(email, password)
    user = find_by(email: email&.downcase)

    return unless user.present?

    hashed_password = User.hash_to_string(
      OpenSSL::PKCS5.pbkdf2_hmac(
        password, user.password_salt, ITERATIONS, DIGEST.length, DIGEST)
    )

    return unless user.password_hash == hashed_password
    user
  end

  def self.hash_to_string(password_hash)
    password_hash.unpack('H*')[0]
  end

  private

  def encrypt_password
    if password.present?
      self.password_salt = User.hash_to_string(OpenSSL::Random.random_bytes(16))
      self.password_hash = User.hash_to_string(OpenSSL::PKCS5.pbkdf2_hmac(
        password, password_salt, ITERATIONS, DIGEST.length, DIGEST))
    end
  end
  
  def username_to_downcase
    username&.downcase!
  end

  def email_to_downcase
    email&.downcase!
  end
end
