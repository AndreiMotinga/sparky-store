# This migration comes from solidus_globalize (originally 20170506202042)
class DropProductPropertyTranslations < ActiveRecord::Migration
  def change
    drop_table :spree_product_property_translations
  end
end
