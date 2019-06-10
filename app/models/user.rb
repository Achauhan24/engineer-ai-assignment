class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable

  validates :email, presence: true, uniqueness: true

  has_one :secret_code, inverse_of: :user
  has_and_belongs_to_many :roles, -> { distinct }

  def admin?
    self.roles.include? Role.admin_user
  end

  def assign_role(role)
    roles.push(role)
  end
end
