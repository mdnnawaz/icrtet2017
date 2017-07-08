class AddFieldToPaymentDetails < ActiveRecord::Migration[5.0]
  def change
    add_column :payment_details, :payUrl, :string
  end
end
