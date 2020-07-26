class CreateAuthors < ActiveRecord::Migration[6.0]
  def change
    create_table :authors do |t|
      t.string :name, limit: 35, null: false
#       t.string :lastname, limit: 35, null: false
      t.timestamps
    end
  end
end
