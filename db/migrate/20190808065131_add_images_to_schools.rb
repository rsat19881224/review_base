class AddImagesToSchools < ActiveRecord::Migration[5.2]
  def change
    add_column :schools, :image, :json
  end
end
