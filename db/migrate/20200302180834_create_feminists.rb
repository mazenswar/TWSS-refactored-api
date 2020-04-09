class CreateFeminists < ActiveRecord::Migration[5.2]
  def change
    create_table :feminists do |t|
      t.string :name
      t.string :profile_img
      t.string :index_img
      t.string :bio
      t.string :philosophy

      t.timestamps
    end
  end
end
