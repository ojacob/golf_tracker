class RoundsController < ApplicationController
  def index
    @rounds = Round.all(:limit => 5)
  end
  
  def show
    @round = Round.find(params[:id])
  end
  
  def new
    @round = Round.new
    18.times do |i|
      round_hole = @round.round_holes.build
    end
  end
  
  def create
    @round = Round.new(params[:round])
    if @round.save
      flash[:notice] = "Congrats for this new round you played !"
      redirect_to(@round)
    else
      render :action => "new"
    end
  end
end
