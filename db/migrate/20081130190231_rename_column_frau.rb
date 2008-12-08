class RenameColumnFrau < ActiveRecord::Migration
  def self.up
    change_table :photos do |t|
      t.rename :frau, :female
      t.rename :vorname, :firstname
      t.rename :nachname, :lastname
      t.rename :studiengang, :school
      t.rename :jahrgang, :year
      t.rename :fachbereich, :major
    end
  end

  def self.down
    change_table :photos do |t|
      t.rename :female, :frau
      t.rename :firstname, :vorname
      t.rename :lastname, :nachname
      t.rename :school, :studiengang
      t.rename :year, :jahrgang
      t.rename :major, :fachbereich
    end
  end
end
