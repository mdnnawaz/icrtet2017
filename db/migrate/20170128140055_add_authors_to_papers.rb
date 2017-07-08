class AddAuthorsToPapers < ActiveRecord::Migration[5.0]
  def change
    add_column :papers, :author1, :string
    add_column :papers, :author2, :string
    add_column :papers, :author3, :string
  end
end
