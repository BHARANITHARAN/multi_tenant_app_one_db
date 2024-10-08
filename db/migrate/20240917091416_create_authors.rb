class CreateAuthors < ActiveRecord::Migration[7.0]
  def change
    create_table :authors do |t|
      t.string :name
      t.string :email
      t.string :mobile
      t.string :domain
      t.text :description
      t.timestamps
    end
  end
end
