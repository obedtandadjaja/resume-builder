class CreateEducationAccomplishments < ActiveRecord::Migration
  def change
    create_table :education_accomplishments do |t|
      t.string :description
      t.references :education, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
