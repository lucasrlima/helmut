class AddRoleToProfiles < ActiveRecord::Migration[6.0]
  def change
    add_column :profiles, :role, :string
  end
end
