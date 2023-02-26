class CreateBookReadingWishists < ActiveRecord::Migration[7.0]
  def change
    create_table :book_reading_wishists do |t|
      t.string :name

      t.timestamps
    end
  end
end
