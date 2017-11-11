class User < ActiveRecord::Base
  has_many :training_plans
  has_many :likes
  has_secure_password
  validates :name, presence: true
  validates :surname, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    format: { with: VALID_EMAIL_REGEX }
  before_save :format_input
  validates :password, presence: true,
                       length: { minimum: 8, maximum: 255 },
                       on: :create

  # enum role: [:trainer, :trainee, :user]
  # after_initialize :set_default_role, if: :new_record?

  def full_name
    "#{name} #{surname}"
  end

  private

    def format_input
      self.email = email.downcase
      self.name = name.titleize
      self.surname = surname.titleize
    end

    # def set_default_role
    #   self.role ||= :user
    # end
end
