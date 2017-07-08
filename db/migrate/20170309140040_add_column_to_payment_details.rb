class AddColumnToPaymentDetails < ActiveRecord::Migration[5.0]
  def change
    add_column :payment_details, :cert, :integer, :null => false, :default => 0
  end
end
