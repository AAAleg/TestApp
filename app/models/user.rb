class User < ActiveRecord::Base

  attr_accessor :password

  email_regex = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i

  validates :name, presence: true
  validates :phone, presence: true, numericality: true, length: { minimum: 10, maximum: 15 }
  validates :email, presence: true, uniqueness: true, format: { with: email_regex }
  validates :password, presence: true, confirmation: true, on: :create
  validates :password_confirmation, presence: true

  before_save :hash_password

  def self.authenticate(params={})
    user = where(email:params[:email]).first
    if user
      user.status && user.right_password?(params[:password]) ? user : nil
    else
      nil
    end
  end

  def right_password?(password)
    self.hashed_password == BCrypt::Engine.hash_secret(password, self.salt)
  end

  private

  def hash_password
    if password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.hashed_password = BCrypt::Engine.hash_secret(password, salt)
    end
  end

end
