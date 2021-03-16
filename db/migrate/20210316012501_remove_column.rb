class RemoveColumn < ActiveRecord::Migration[6.0]
  def change
    remove_column :profiles, :last_name_string
  end
end
