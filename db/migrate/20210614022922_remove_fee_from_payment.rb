class RemoveFeeFromPayment < ActiveRecord::Migration[6.0]
  def change
    remove_column :payments, :fee, :integer
  end
end
