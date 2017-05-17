class User < ActiveRecord::Base

  has_secure_password

  has_many :reviews

  validates :email, uniqueness: { message: "Email already in the system" }

end
