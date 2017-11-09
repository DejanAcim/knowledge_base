class User < ActiveRecord::Base
  has_many :training_plans
  has_many :likes
  has_secure_password
  validates :name, presence: true
  validates :surname, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: { case_sensitive: false },
                                    format: { with: VALID_EMAIL_REGEX }
  before_save { self.email = email.downcase }

  def full_name
    "#{name} #{surname}"
  end
end
