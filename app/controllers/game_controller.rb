class GameController < ApplicationController
  before_filter :get_current, :except => [:index]
  before_filter :get_score, :except => [:index, :pick_a_face]

  def index
  end

  def pick_a_face
    @target = Photo.find_by_sql("select * from photos order by rand() limit 0,1").first
    @choice = Photo.find_by_sql("select * from photos where not(id = " + @target.id.to_s + ") order by rand() limit 0,4")
    @choice.insert(rand(5),@target);
  end

  def pick_a_face_ajax
    if params['pick'] 
      if params['pick'].to_i == session['target'].id
	@current_score.increase
	session['target'] = nil
	render :json => [ true, @current_score.points ]
      else
	@current_score.decrease
	render :json => [ false, @current_score.points ]
      end
    else

      if( params['school'].blank? ) 
	@target = Photo.find(:first, :order => "rand()", :limit => 1)
	@choice = Photo.find(:all, :order => "rand()", :limit => 4, :conditions => ["not(id=?)", @target.id.to_s])
      else 
	@target = Photo.find(:first, :order => "rand()", :limit => 1, :conditions => ["(school=?)", params['school']])
	@choice = Photo.find(:all,   :order => "rand()", :limit => 4, :conditions => ["(school=?) AND NOT(id=?)", params['school'], @target.id.to_s])
      end
      session['target'] = @target
      @choice.insert(rand(5),@target)
    end
  end


private
  def get_current
    @current_game = Game.init("pick_a_face")
  end

  def get_score
    @current_score = Score.find(:first, :conditions => {:player_id => @current_player.id, :game_id => @current_game.id})
    if (@current_score.nil?) 
      @current_score = Score.create( :player_id => @current_player.id, :game_id => @current_game.id, :points => 0 )
      @current_score.save
    end
  end
end
