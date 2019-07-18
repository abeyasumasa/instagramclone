class AddphotoRefToPhotos < ActiveRecord::Migration[5.2]
  def change
    add_column :photos , :image , :text
  end
end
