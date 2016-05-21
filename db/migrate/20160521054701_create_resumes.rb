class CreateResumes < ActiveRecord::Migration
  def change
    create_table :resumes do |t|
      t.string :objective
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
