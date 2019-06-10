class AddUserToSecretCodes < ActiveRecord::Migration[5.2]
  def change
    add_reference :secret_codes, :user, foreign_key: true
  end
end
