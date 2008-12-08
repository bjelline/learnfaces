class Game < ActiveRecord::Base

    def self.init (n)
      g = Game.find(:first, :conditions => [ "name = ?", n])
      if g.nil?
	g = Game.create(:name => n)
	g.save
      end
      return g
    end

end
