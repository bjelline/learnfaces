class CreateGames < ActiveRecord::Migration
  def self.up
    create_table :games do |t|
      t.string :name 
      t.timestamps
    end

    add_index :games, :name
  end

  def self.down
    drop_table :games
  end
end
