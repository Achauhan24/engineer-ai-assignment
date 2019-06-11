class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable

  before_save { self.email = email.downcase }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }
  validates :first ,presence: true, length: { maximum: 50 }
  validates :last ,presence: true, length: { maximum: 50 }
  validates :password, presence: true, length: { minimum: 6 }

  has_one :secret_code, inverse_of: :user
  has_and_belongs_to_many :roles, -> { distinct }

  def admin?
    self.roles.include? Role.admin_user
  end

  def assign_role(role)
    roles.push(role)
  end
end
