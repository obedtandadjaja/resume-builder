class CreateAdditionalInfos < ActiveRecord::Migration
  def change
    create_table :additional_infos do |t|
      t.string :description
      t.references :resume, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
