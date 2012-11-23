class PitchesController < ApplicationController
 
  def new
    @pitch = Pitch.new
    @pitch.player_id = params[:id]
    
    @locations = [1, 1, 1, 1, 2, 2, 2, 2,
                  1, 3, 3, 4, 4, 5, 5, 2, 
                  1, 3, 3, 4, 4, 5, 5, 2,
                  1, 6, 6, 7, 7, 8, 8, 2,
                  9, 6, 6, 7, 7, 8, 8, 10,
                  9, 11, 11, 12, 12, 13, 13, 10,
                  9, 11, 11, 12, 12, 13, 13, 10, 
                  9, 9, 9, 9, 10, 10, 10, 10]
    @labels = ["Fastball", "Change Up", "Screwball", "Rise Ball", "Curveball", "Drop Ball"]
    @outcomes = ["Hit", "Swing and Miss", "Out", "Take", "Foul", "Hit by Pitch"]
  end
  
  def create
    @pitch = Pitch.new(params[:pitch])
    if @pitch.save
      flash[:success] = "Pitch has been recorded."
      redirect_to root_url
    else
      flash[:error] = "Error submitting pitch."
      redirect_to root_url
    end
  end
  
  
  def destroy
    
  end
end
