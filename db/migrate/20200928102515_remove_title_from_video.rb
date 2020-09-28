class RemoveTitleFromVideo < ActiveRecord::Migration[6.0]
  def change
    remove_column :videos, :title, :string
  end
end
