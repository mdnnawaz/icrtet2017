class AddJournalToPaymentDetails < ActiveRecord::Migration[5.0]
  def change
    add_column :payment_details, :journal, :string
  end
end
