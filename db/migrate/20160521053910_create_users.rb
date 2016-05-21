class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :display_name
      t.string :street_address
      t.string :zip
      t.string :city
      t.string :state
      t.string :phone

      t.timestamps null: false
    end
  end
end
