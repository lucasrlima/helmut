class AddDoneToJobs < ActiveRecord::Migration[6.0]
  def change
    add_column :jobs, :done, :boolean, null: false, default: false
  end
end
