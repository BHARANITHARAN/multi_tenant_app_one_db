# db/migrate/add_admin_to_users.rb
class AddAdminToAuthors < ActiveRecord::Migration[6.0]
  def change
    add_column :authors, :admin, :boolean, default: false
  end
end
