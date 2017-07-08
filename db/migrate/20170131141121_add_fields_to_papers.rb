class AddFieldsToPapers < ActiveRecord::Migration[5.0]
  def change
    add_column :papers, :acc, :boolean, default: false
    add_column :papers, :rej, :boolean, default: false
    add_column :papers, :rev, :boolean, default: false
  end
end
