class User < ApplicationRecord
  attr_accessor :remember_token, :activation_token, :reset_token
  before_save { self.email = email.downcase }
  has_one_attached :avatar
  attr_accessor :reset_token
  attr_accessor :remember_token, :activation_token



  # Verify that email field is not blank and that it doesn't already exist in the db (prevents duplicates):
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false}

  # Password Validations
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  # Activates an account.
  def activate
    update_attribute(:activated,    true)
    update_attribute(:activated_at, Time.zone.now)
  end

  # Sends activation email.
  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end

# Sets the password reset attributes.
def create_reset_digest
  self.reset_token = User.new_token
  update_attribute(:reset_digest,  User.digest(reset_token))
  update_attribute(:reset_sent_at, Time.zone.now)
end

# Sends password reset email.
def send_password_reset_email
  UserMailer.password_reset(self).deliver_now
end

# Returns true if a password reset has expired.
def password_reset_expired?
  reset_sent_at < 2.hours.ago
end

private

# Converts email to all lower-case.
def downcase_email
  self.email = email.downcase
end

# Converts email to all lower-case.
def downcase_email
  self.email = email.downcase
end
end
