class PlayersController < ApplicationController
  
  def index
    @players = Player.where(user_id: current_user.id)
  end
  
  def show
    @player = Player.find(params[:id])
  end
  
  def new 
    @player = Player.new
  end
  
  def update_order
    @player = Player.find(params[:id])
    @other = Player.where(user_id: @player.user_id, order_num: params[:order_num].to_i + params[:direction].to_i).first
    if @player.nil? || @other.nil?
      redirect_to root_url, flash: {message: "Cannot move player."}
    elsif @player.update_attribute(:order_num, params[:order_num].to_i + params[:direction].to_i) && @other.update_attribute(:order_num, params[:order_num].to_i)
      redirect_to root_url
    else
      redirect_to root_url
    end
  end
  
  def active
    @player = Player.find(params[:id])
    @player.active = true
    @player.order_num = @player.user.active_players.count + 1
    if @player.save
      redirect_to root_url, flash: {success: "#{@player.first_name} is now active."}
    else
      redirect_to root_url, flash: {failure: "An error has occurred."}
    end
  end
  
  def bench
    @player = Player.find(params[:id])
    @player.active = false
    if @player.save
      @player.user.active_players.each_with_index do |player, index|
        player.order_num = index+1
        player.save
      end
      redirect_to root_url, flash: {message: "#{@player.first_name} is now on the bench."}
    else
      redirect_to root_url, flash: {failure: "An error has occurred."}
    end
  end
  
  def edit
    
  end
  
  def create
    @player = Player.new(params[:player])
    @player.user_id = current_user.id
    if @player.save
      flash[:success] = "#{@player.first_name} has been created."
      redirect_to root_url
    else
      render 'new'
    end
  end
  
  def destroy
    @player.user_id = nil
    @player.save
  end
  
end
