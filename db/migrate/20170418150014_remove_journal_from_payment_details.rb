class RemoveJournalFromPaymentDetails < ActiveRecord::Migration[5.0]
  def change
    remove_column :payment_details, :journal, :string
  end
end
