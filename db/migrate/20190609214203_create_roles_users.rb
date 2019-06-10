class CreateRolesUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :roles_users do |t|
      t.bigint "role_id"
      t.bigint "user_id"
    end
  end
end
