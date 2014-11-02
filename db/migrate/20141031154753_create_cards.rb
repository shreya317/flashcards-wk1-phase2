class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.belongs_to :deck
      t.string :image_url
      t.string :answer

      t.timestamps
    end
  end
end
