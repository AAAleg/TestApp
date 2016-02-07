class User < ActiveRecord::Base

  email_regex = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i

  validates :name, presence: true
  validates :phone, presence: true, numericality: true, length: { minimum: 10, maximum: 15 }
  validates :email, presence: true, uniqueness: true, format: { with: email_regex }

end
