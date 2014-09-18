class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :name
      t.text :description
      t.text :url
      t.references :gallery
      t.timestamps
    end
  end
end
