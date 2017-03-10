class User < ApplicationRecord
  has_many :enrollments
  has_many :courses, :through => :enrollments

	before_save { self.email = email.downcase }
	validates :first_name, presence: true, length:{maximum: 25}
	validates :last_name, presence: true
  validates :username, presence: true
	# the above test causes to fail
	# validates :email, presence: true, length:{maximum:255}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
