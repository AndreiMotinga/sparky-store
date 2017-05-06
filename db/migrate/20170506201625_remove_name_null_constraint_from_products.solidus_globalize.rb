# This migration comes from solidus_globalize (originally 20170503152944)
class RemoveNameNullConstraintFromProducts < ActiveRecord::Migration
  def up
    change_column :spree_products, :name, :string, null: true
  end

  def down
    change_column :spree_products, :name, :string, null: false
  end
end
