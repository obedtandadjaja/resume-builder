class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string :title
      t.references :resume, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
