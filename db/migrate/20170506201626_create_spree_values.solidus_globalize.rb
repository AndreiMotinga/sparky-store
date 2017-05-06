# This migration comes from solidus_globalize (originally 20170505191034)
class CreateSpreeValues < ActiveRecord::Migration
  def change
    create_table :spree_values do |t|
      t.string :name

      t.timestamps
    end
  end
end
