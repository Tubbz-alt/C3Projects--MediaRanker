class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.string :director
      t.text :description
      t.integer :vote
      t.timestamps null: false
    end
  end
end
