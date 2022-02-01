class AddSpendingToPayment < ActiveRecord::Migration[6.0]
  def change
    add_column :payments, :spending, :float
  end
end
