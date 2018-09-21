class PlayersController < ApplicationController
  def index
    @players = Player.all
  end

  def remote_players
    @players = Player.all
    render json: @players.to_json(include: { team: { methods: [:full_name] } })
  end

  def show
    @player = Player.find(params[:id])
  end

  def new
    @player = Player.new
  end

  def edit
    @player = Player.find(params[:id])
  end

  def create
    @player = Player.new(player_params)

    respond_to do |format|
      if @player.save
        format.html { redirect_to @player, notice: 'Player was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    @player = Player.find(params[:id])

    respond_to do |format|
      if @player.update(player_params)
        format.html { redirect_to @player, notice: 'Player was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @player = Player.find(params[:id])

    @player.destroy
    respond_to do |format|
      format.html { redirect_to players_url, notice: 'Player was successfully destroyed.' }
    end
  end

  private

  def player_params
    params.require(:player).permit(:name, :number, :position, :club, :team_id)
  end
end
