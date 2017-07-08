class AddRevdownloadedColumnToPapers < ActiveRecord::Migration[5.0]
  def change
    add_column :papers, :isReviewed, :boolean, :default => false
  end
end
