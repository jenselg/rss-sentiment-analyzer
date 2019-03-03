class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :link
      t.string :title
      t.text :description
      t.float :score
      t.datetime :published_at
      t.references :feed, foreign_key: true

      t.timestamps
    end
  end
end
