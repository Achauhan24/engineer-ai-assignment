class SecretCode < ApplicationRecord
  belongs_to :user, inverse_of: :secret_code, required: false
  before_create :set_secret_code

  def set_secret_code
    if self.code.nil?
      charset = Array('A'..'Z') + Array('a'..'z')
      self.code = Array.new(6) { charset.sample }.join
    end
  end

end
