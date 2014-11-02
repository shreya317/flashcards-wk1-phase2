class CreateTurns < ActiveRecord::Migration
  def change
    create_table :turns do |t|
      t.belongs_to :player
      t.belongs_to :card
      t.integer :times_guessed
      t.integer :correct_guesses

      t.timestamps
    end
  end
end
