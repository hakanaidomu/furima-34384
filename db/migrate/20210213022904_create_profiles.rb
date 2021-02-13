class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.integer    :postal_code,     null: false
      t.integer    :prefecture,      null: false
      t.string     :city,            null: false         
      t.string     :house_number,    null: false
      t.string     :building_name
      t.string     :tel,             null: false
      t.references :order,           foreign_key: true
      t.timestamps
    end
  end
end
