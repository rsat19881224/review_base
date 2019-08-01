class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.references :school, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :rate, null: false
      t.text :content, null: false

      t.timestamps
    end
  end
end
