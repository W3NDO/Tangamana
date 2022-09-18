class TavernsController < ApplicationController
  before_action :set_tavern, only: %i[ show edit update destroy ]

  # GET /taverns or /taverns.json
  def index
    @taverns = Tavern.all
  end

  # GET /taverns/1 or /taverns/1.json
  def show
  end

  # GET /taverns/new
  def new
    @tavern = Tavern.new
  end

  # GET /taverns/1/edit
  def edit
  end

  # POST /taverns or /taverns.json
  def create
    @tavern = Tavern.new(tavern_params)
    @tavern.user_id = current_user.id
    
    respond_to do |format|
      if @tavern.save
        TavernMember.create(tavern_id: @tavern.id, user_id: current_user.id)
        format.html { redirect_to root_path}
        format.json { render :show, status: :created, location: @tavern }
      else
        format.html { redirect_to root_path, notice: "Failed to create new tavern" }
        format.json { render json: @tavern.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /taverns/1 or /taverns/1.json
  def update
    respond_to do |format|
      if @tavern.update(tavern_params)
        format.html { redirect_to root_path }
        format.json { render :show, status: :ok, location: @tavern }
      else
        format.html { redirect_to root_path, notice: "Failed to update tavern" }
        format.json { render json: @tavern.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /taverns/1 or /taverns/1.json
  def destroy
    @tavern.destroy

    respond_to do |format|
      format.html { redirect_to taverns_url, notice: "Tavern was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tavern
      @tavern = Tavern.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tavern_params
      params.require(:tavern).permit(:name, :topic)
    end
end
