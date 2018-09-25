class ScoresController < ApplicationController
  def index
    @scores = Score.all

    respond_to do |format|
      format.html
      format.json do
        render(
          json:
            @scores.to_json(
              include: {
                home_team: {
                  methods: [:full_name]
                }, visitor_team: {
                  methods: [:full_name]
                }
              },
              methods: [:winner_team, :points_for_winner_team]
            )
        )
      end
    end
  end

  def show
    @score = Score.find(params[:id])
  end

  def new
    @score = Score.new
  end

  def edit
    @score = Score.find(params[:id])
  end

  def create
    @score = Score.new(score_params)

    respond_to do |format|
      if @score.save
        format.html { redirect_to @score, notice: 'Score was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    @score = Score.find(params[:id])

    respond_to do |format|
      if @score.update(score_params)
        format.html { redirect_to @score, notice: 'Score was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @score = Score.find(params[:id])

    @score.destroy
    respond_to do |format|
      format.html { redirect_to scores_url, notice: 'Score was successfully destroyed.' }
    end
  end

  private

  def score_params
    params.require(:score).permit(
      :home_team_id,
      :visitor_team_id,
      :home_goals,
      :visitor_goals,
      :overtime
    )
  end
end
