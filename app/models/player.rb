class Player < ActiveRecord::Base

  def is_admin?
    self.username == "bjelline"
  end
end
