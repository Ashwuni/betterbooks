class AddLastnameToAuthor < ActiveRecord::Migration[6.0]
  def change
    add_column :authors, :lastname, :string, limit: 35, null:false
  end
end
