class DansController < ApplicationController
  before_action :set_dan, only: [:show, :edit, :update, :destroy]

  # GET /dans
  # GET /dans.json
  def index
    @dans = Dan.all
  end

  # GET /dans/1
  # GET /dans/1.json
  def show
  end

  # GET /dans/new
  def new
    @dan = Dan.new
  end

  # GET /dans/1/edit
  def edit
  end

  # POST /dans
  # POST /dans.json
  def create
    @dan = Dan.new(dan_params)

    respond_to do |format|
      if @dan.save
        format.html { redirect_to @dan, notice: 'Dan was successfully created.' }
        format.json { render :show, status: :created, location: @dan }
      else
        format.html { render :new }
        format.json { render json: @dan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dans/1
  # PATCH/PUT /dans/1.json
  def update
    respond_to do |format|
      if @dan.update(dan_params)
        format.html { redirect_to @dan, notice: 'Dan was successfully updated.' }
        format.json { render :show, status: :ok, location: @dan }
      else
        format.html { render :edit }
        format.json { render json: @dan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dans/1
  # DELETE /dans/1.json
  def destroy
    @dan.destroy
    respond_to do |format|
      format.html { redirect_to dans_url, notice: 'Dan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dan
      @dan = Dan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dan_params
      params.require(:dan).permit(:name, :level, :first_song_id, :second_song_id, :integer, :third_song_id, :integer, :photo)
    end
end
