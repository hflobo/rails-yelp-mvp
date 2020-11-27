class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.text :content, null: false
      t.integer :rating, null: false
      t.references :restaurant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
