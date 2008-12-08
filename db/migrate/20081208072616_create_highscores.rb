class CreateHighscores < ActiveRecord::Migration
  def self.up
    create_table :highscores do |t|
      t.integer :game_id
      t.integer :player_id
      t.integer :score

      t.timestamps
    end

    add_index :highscores, :game_id
    add_index :highscores, :player_id
  end

  def self.down
    drop_table :highscores
  end
end
