class AddFieldToPapers < ActiveRecord::Migration[5.0]
  def change
    add_column :papers, :pid, :string
    add_index :papers, :pid, unique: true
  end
end
