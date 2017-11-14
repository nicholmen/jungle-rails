class User < ActiveRecord::Base

  has_secure_password

  validates :email, presence: true, uniqueness: true

  validates :name, presence: true

  validates :password, length: { minimum: 2 }

  has_many :reviews

  before_save :to_lower_case
  before_save :to_no_spaces

  def to_lower_case
    self.email = self.email.downcase
  end

  def to_no_spaces
    self.email = self.email.strip
  end

  def self.authenticate_with_credentials(email, password)

    @user = User.find_by(email: email)    # If the user exists AND the password entered is correct.
    if @user && @user.authenticate(password)
      @user
    else
      nil
    end

  end

end
