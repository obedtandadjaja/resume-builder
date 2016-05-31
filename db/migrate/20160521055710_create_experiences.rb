class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.string :company
      t.string :position
      t.string :location
      t.integer :start_date
      t.integer :end_date
      t.boolean :is_employed
      t.references :resume, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
