class RemovePidFromPapers < ActiveRecord::Migration[5.0]
  def change
    remove_column :papers, :pid, :string
  end
end
