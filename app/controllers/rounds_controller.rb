class RoundsController < ApplicationController
  def index
    @rounds = Round.find_all_by_current_state("done", :limit => 5, :order => "played_on DESC")
  end
  
  def show
    @round = Round.find(params[:id])
  end
  
  def new
    @round = Round.create
    redirect_to edit_round_url(@round)
  end

  def edit
    @round = Round.find(params[:id])
    render :action => "select_course" if @round.created?
  end

  def update
    step = params[:round][:step]
    params[:round].delete(:step)
    @round = Round.find(params[:id])
    
    if @round.created? && step == "course-selection"
      course = Course.find(params[:round][:course_id])
      @round.update_attributes(params[:round])
      
      # Avoid validation on save to allow Round to create empty RoundHoles for the next screen
      if @round.select_course! && @round.save(false)
        render :action => "round_score"
      else
        render :action => "select_course"
      end
    elsif @round.course_selected? && step == "score-card"
      if @round.update_attributes(params[:round]) && @round.score_entered!
        redirect_to round_url(@round)
      else
        render :action => "round_score"
      end
    end
  end
end
