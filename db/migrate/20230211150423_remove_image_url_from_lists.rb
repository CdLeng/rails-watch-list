class RemoveImageUrlFromLists < ActiveRecord::Migration[7.0]
  def change
    remove_column :lists, :image_url, :string
  end
end
