class RostersController < ApplicationController
  before_action       :authenticate_user!
  before_action :set_roster, only: [:show, :edit, :update, :destroy]

  # GET /rosters
  def index
    @rosters = current_user.rosters.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /rosters/1
  def show
  end

  # GET /rosters/new
  def new
    @roster = Roster.new
  end

  # GET /rosters/1/edit
  def edit
  end

  # POST /rosters
  def create
    @roster = current_user.rosters.new(roster_params)

    if @roster.save
      redirect_to @roster, notice: 'Roster was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /rosters/1
  def update
    if @roster.update(roster_params)
      redirect_to @roster, notice: 'Roster was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /rosters/1
  def destroy
    @roster.destroy
    redirect_to rosters_url, notice: 'Roster was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_roster
      @roster = Roster.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def roster_params
      params.require(:roster).permit(:title,
         :user_id,
         :contact_ids,
         roster_contacts_attributes: [:id, :_destroy, :contact_id, contact_attributes: [:id, :_destroy, :first_name, :last_name]]
         )
    end
end
