class CreateExperienceDuties < ActiveRecord::Migration
  def change
    create_table :experience_duties do |t|
      t.string :description
      t.references :experience, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
