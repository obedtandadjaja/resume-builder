class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :description
      t.string :url
      t.references :resume, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
