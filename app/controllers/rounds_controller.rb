class RoundsController < ApplicationController
  def index
    @rounds = Round.all(:limit => 5)
  end
  
  def show
    @round = Round.find(params[:id])
    respond_to do |format|
      format.html
      format.xml { render :xml => @round }
    end
  end
  
  def new
    @round = Round.new
    18.times do |i|
      round_hole = @round.round_holes.build
    end
  end
  
  def create
    @round = Round.new(params[:round])
    respond_to do |format|
      if @round.save
        flash[:notice] = "Congrats for this new round you played !"
        format.html { redirect_to(@round) }
        format.xml { render :xml => @round, :status => :created, :location => @round }
      else
        format.html { render :action => "new" }
        format.xml { render :xml => @round.errors, :status => :unprocessable_entity }
      end
    end
  end
end
