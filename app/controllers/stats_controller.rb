class StatsController < ApplicationController
  def index
    @stats = Stats.new
    totals = compute_totals
    @stats.average_score = totals[:score] / Round.count
  end
  
private
  def compute_totals
    total_score = 0
    
    rounds = Round.all
    rounds.each do |round|
      total_score += round.score
      puts "total_score is now #{total_score}"
    end
    
    totals = {}
    totals[:score] = total_score
    totals
  end
end
