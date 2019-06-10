class Role < ApplicationRecord
  has_and_belongs_to_many :users, -> { distinct }
  validates :role, presence: true, uniqueness: true

  class << self
    def admin_user
      Role.find_by(role: 'admin_user') || Role.create!(role: 'admin_user', description: 'Admin User')
    end
  end

end
