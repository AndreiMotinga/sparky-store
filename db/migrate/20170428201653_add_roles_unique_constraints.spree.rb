# This migration comes from spree (originally 20170422134804)
class AddRolesUniqueConstraints < ActiveRecord::Migration[5.0]
  def change
    return if ENV["DATABASE"] == "sparky"
    add_index :spree_roles, :name, unique: true
    add_index :spree_roles_users, [:user_id, :role_id], unique: true
  end
end
