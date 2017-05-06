# This migration comes from solidus_globalize (originally 20170506175142)
class AddTranslationsToValues < ActiveRecord::Migration
  def up
    params = { name: :string }
    Spree::Value.create_translation_table!(params, { migrate_data: true })
  end

  def down
    Spree::Value.drop_translation_table! migrate_data: true
  end
end
