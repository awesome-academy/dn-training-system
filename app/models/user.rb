class User < ApplicationRecord
  attr_accessor :remember_token

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  VALID_NAME_REGEX = /\A[^0-9`!@#\$%\^&*+_=]+\z/.freeze

  has_secure_password
  validates :email, presence: true,
            length: {maximum: Settings.user.max_length},
            format: {with: VALID_EMAIL_REGEX}, uniqueness: true
  validates :name, presence: true, length: {maximum: Settings.user.max_length},
            format: {with: VALID_NAME_REGEX}
  validates :gender, inclusion: {in: [true, false]}
  validates :password, presence: true
  validates :password, length: {minimum: Settings.user.pass.length_min}

  before_save :downcase_email

  class << self
    def digest string
      cost = if ActiveModel::SecurePassword.min_cost
               BCrypt::Engine::MIN_COST
             else
               BCrypt::Engine.cost
             end
      BCrypt::Password.create(string, cost: cost)
    end

    def new_token
      SecureRandom.urlsafe_base64
    end
  end

  def forget
    update_column :remember_digest, nil
  end

  def remember
    self.remember_token = User.new_token
    update_column :remember_digest, User.digest(remember_token)
  end

  def authenticated? remember_token
    BCrypt::Password.new(remember_digest).is_password? remember_token
  end

  private

  # Converts email to all lower-case.
  def downcase_email
    email.downcase!
  end
end
