class AddColumnsToJournalpayment < ActiveRecord::Migration[5.0]
  def change
    add_column :journalpayments, :name, :string
    add_column :journalpayments, :ref_id, :string
  end
end
