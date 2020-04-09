class CreateQuotes < ActiveRecord::Migration[5.2]
  def change
    create_table :quotes do |t|
      t.belongs_to :feminist, foreign_key: true
      t.string :content
      t.string :source

      t.timestamps
    end
  end
end
