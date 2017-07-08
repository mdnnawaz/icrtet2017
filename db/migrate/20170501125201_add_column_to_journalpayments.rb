class AddColumnToJournalpayments < ActiveRecord::Migration[5.0]
  def change
    add_column :journalpayments, :paylink, :string
  end
end
