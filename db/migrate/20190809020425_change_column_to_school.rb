class ChangeColumnToSchool < ActiveRecord::Migration[5.2]
  def change
  	change_column :schools, :image, :text
  end
end
