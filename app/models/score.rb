class Score < ActiveRecord::Base
  belongs_to :game
  belongs_to :player


  def decrease
    self.points -= 1
    self.save
  end

  def increase
    self.points += 1
    self.save
  end
end
