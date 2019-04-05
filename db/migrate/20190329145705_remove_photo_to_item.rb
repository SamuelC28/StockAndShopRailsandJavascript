class RemovePhotoToItem < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :photo
  end
end
