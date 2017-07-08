class AddAcceptToPaymentDetails < ActiveRecord::Migration
  def change
    add_column :payment_details, :accept, :boolean
  end
end
