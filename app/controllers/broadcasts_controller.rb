class BroadcastsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_broadcast, only: [:show, :edit, :update, :destroy]

  # GET /broadcasts
  def index
    @broadcasts = Broadcast.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @broadcasts }
      format.json  { render :json => @broadcasts.to_json }
    end
    
  end

  # GET /broadcasts/1
  def show
  end

  # GET /broadcasts/new
  def new
    @broadcast = current_user.broadcasts.new
  end

  # GET /broadcasts/1/edit
  def edit
  end

  # POST /broadcasts
  def create
    @broadcast = current_user.broadcasts.new(broadcast_params)

    if @broadcast.save
      # broadcast_sent_forth  = Message.new.send_message_to_roster(roster_id: (broadcast_params["roster_id"]).to_i,
      #     body: (broadcast_params["message_body"]).to_s,
      #     user_name: "#{current_user.first_name} #{current_user.last_name}"
      #     )
          dispatched_broadcast = Broadcast.dispatch(@broadcast.id)
      redirect_to @broadcast, notice: 'Broadcast was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /broadcasts/1
  def update
    if @broadcast.update(broadcast_params)
      redirect_to @broadcast, notice: 'Broadcast was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /broadcasts/1
  def destroy
    @broadcast.destroy
    redirect_to broadcasts_url, notice: 'Broadcast was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_broadcast
      @broadcast = Broadcast.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def broadcast_params
      params.require(:broadcast).permit(:user_id, 
        :roster_id, 
        :message_body, 
        :message_title, 
        :message_script_id,
        :dispatched_at
        )
    end
end
