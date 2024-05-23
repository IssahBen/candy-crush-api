class Api::V1::ScoresController < ApplicationController
  before_action :set_score, only: %i[ show update destroy ]

  # GET /scores
  def index
    users = User.all
    data =[]
    @scores = Score.all
    users.each do |user|
      dictionary = {}
     dictionary[:email] = user.email
     dictionary[:highestscore] = user.scores.max
     data << dictionary
    end 


    render json: data.as_json()
  end

  # GET /scores/1
  def show
    render json: @score
  end

  # POST /scores
  def create
    score = params.require(:score)
    score = score[:score]
    user_id = current_user.id
    @score = Score.new(score:score,user_id:user_id)

    if @score.save
      puts 3
      render json: @score, status: :created
    else
      puts 4
      render json: @score.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /scores/1
  def update
    if @score.update(score_params)
      render json: @score
    else
      render json: @score.errors, status: :unprocessable_entity
    end
  end

  # DELETE /scores/1
  def destroy
    @score.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_score
      @score = Score.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
   
end
