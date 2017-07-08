class AddColumnsToPaymentDetails < ActiveRecord::Migration[5.0]
  def change
    add_column :payment_details, :ref_id, :string
    add_column :payment_details, :paid, :boolean
    add_column :payment_details, :cust_id, :string
  end
end
