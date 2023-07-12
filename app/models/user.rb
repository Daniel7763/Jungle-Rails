class User < ApplicationRecord
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 5 }
  before_save :normalize_email

  def normalize_email
    self.email = self.email.downcase.strip
  end

  def self.authenticate_with_credentials(email, password)
    user = find_by(email: email.strip.downcase)
    user&.authenticate(password)
  end

end
