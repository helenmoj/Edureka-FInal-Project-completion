class User < ApplicationRecord
  before_save { self.email = email.downcase }
  has_one_attached :avatar



  # Verify that email field is not blank and that it doesn't already exist in the db (prevents duplicates):
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
end

private

# Converts email to all lower-case.
def downcase_email
  self.email = email.downcase
end

# Creates and assigns the activation token and digest.
#def create_activation_digest
 # self.activation_token  = User.new_token
  #self.activation_digest = User.digest(activation_token)
#end
