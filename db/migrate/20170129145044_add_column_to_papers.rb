class AddColumnToPapers < ActiveRecord::Migration[5.0]
  def change
    add_column :papers, :status, :string
  end
end
