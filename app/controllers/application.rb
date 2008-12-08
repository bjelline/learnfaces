# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  before_filter :initialize_player

  #helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  #protect_from_forgery # :secret => '4f1c18f3cd16fe2bedf634495bba8881'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password
  
  def logged_in?
    @current_player.is_a?(Player)
  end

  def initialize_player
     @current_player = Player.find(:first, :conditions => ["username = ?", ENV['REMOTE_USER']]) 
     if @current_player.nil?
       @current_player = Player.find(:first, :conditions => ["username = ?", "gast"]) 
       if @current_player.nil?
	 p = Player.create(:username => "gast")
	 p.save
	 @current_player = Player.find(:first, :conditions => ["username = ?", "gast"]) 
       end
     end
  end
 
end
