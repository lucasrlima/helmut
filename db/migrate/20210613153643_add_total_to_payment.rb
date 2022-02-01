class AddTotalToPayment < ActiveRecord::Migration[6.0]
  def change
    add_column :payments, :total, :float
  end
end
