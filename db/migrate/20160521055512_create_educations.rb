class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.string :school_name
      t.string :school_location
      t.string :major
      t.string :minor
      t.string :degree
      t.decimal :gpa
      t.boolean :is_enrolled
      t.integer :start_date
      t.integer :end_date
      t.references :resume, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
