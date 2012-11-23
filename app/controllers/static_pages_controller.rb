class StaticPagesController < ApplicationController

  def home
    if signed_in?
      @players_active = current_user.players.where(active: true).order(:order_num)
      @players_bench = current_user.players.where(active: false).order(:last_name)
    end
  end
  
  def help
  end

  def about
  end

  def contact
  end
end
