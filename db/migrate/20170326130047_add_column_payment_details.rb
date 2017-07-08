class AddColumnPaymentDetails < ActiveRecord::Migration[5.0]
  def change
  	add_column :payment_details, :isPaid, :boolean, :default => false
  end
end
