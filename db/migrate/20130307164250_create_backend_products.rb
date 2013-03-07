class CreateBackendProducts < ActiveRecord::Migration
  def change
    create_table :backend_products do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.integer :inventory
      t.boolean :active
      t.hstore :tags

      t.timestamps
    end
  end
end
