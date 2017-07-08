class AddExtraAuthorsToPapers < ActiveRecord::Migration[5.0]
  def change
    add_column :papers, :author4, :string
    add_column :papers, :author5, :string
  end
end
