class AddFieldsToPaymentDetails < ActiveRecord::Migration
  def change
    add_column :payment_details, :students, :integer, :null => false, :default => 0
    add_column :payment_details, :staff, :integer, :null => false, :default => 0
  end
end
