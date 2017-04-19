require 'bcrypt'
class User < ApplicationRecord
  validates :username, :session_token, :password_digest, presence: true
  validates :password_digest, presence: { message: "Password can't be blank" }
  validates :password, length: { minimum: 6 }, allow_nil: true # => validation will call password reader method in backend
  # => validation may not be nil -- only exists on the instance for which we created the pass.
  # => this makes sense, since we only need to validate the pass if its been changed

  after_initialize :ensure_session_token


  before_validation :ensure_session_token

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username) #username is unique so can find by that
    return nil if user.nil?
    user.is_password?(password) ? user : nil
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64
  end

  def reset_session_token!
    self.session_token = self.class.generate_session_token
    self.save!
    self.session_token
  end

  def password
    @password
  end

  def password=(password)
    @password = password #necessary for validation
    self.password_digest = BCrypt::Password.create(password)#create necessary here --> creates new obj
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
    #use new factory method because we're building password object from existing hash.
  end

  def user_params
    params.require(:user).permit(:username, :password) #this mass-assignment will call password= setter method in the backend (ty AR)
  end

  private
  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end

end
