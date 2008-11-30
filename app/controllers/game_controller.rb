class GameController < ApplicationController

	def index
	end

	def pick_a_face
	    @target = Photo.find_by_sql("select * from photos order by rand() limit 0,1").first
	    @choice = Photo.find_by_sql("select * from photos where not(id = " + @target.id.to_s + ") order by rand() limit 0,4")
	    @choice.insert(rand(5),@target);
	end
end
