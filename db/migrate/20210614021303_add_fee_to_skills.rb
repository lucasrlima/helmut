class AddFeeToSkills < ActiveRecord::Migration[6.0]
  def change
    add_column :skills, :fee, :integer
  end
end
