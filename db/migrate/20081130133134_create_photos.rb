class CreatePhotos < ActiveRecord::Migration
  def self.up
    create_table :photos do |t|
      t.string :filename
      t.string :firstname
      t.string :lastname
      t.timestamps
      t.boolean :female
      t.string :school
      t.string :year
      t.string :major
    end
  end

  def self.down
    drop_table :photos
  end
end
