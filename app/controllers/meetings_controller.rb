class MeetingsController < ApplicationController
  before_action :set_meeting, only: [:show, :edit, :update]

  # GET /meetings
  # GET /meetings.json
  def index
    @meetings = Meeting.where('team_id = ?', current_user.team_id)
  end

  # GET /meetings/1
  # GET /meetings/1.json
  def show
  end

  # GET /meetings/new
  def new
    @meeting = Meeting.new
    @user = current_user
    @team = Team.find(params[:team_id])

  end

  # GET /meetings/1/edit
  def edit
  end

  # POST /meetings
  # POST /meetings.json
  def create
    @team = Team.find(params[:team_id])
    @meeting = Meeting.new(meeting_params)
    @user = current_user

    respond_to do |format|
      if @meeting.save
        puts @team[:team_id]
        format.html { redirect_to team_path(@team, @user), notice: 'Meeting was successfully created.' }
        format.json { render :show, status: :created, location: team_path(@team, @user) }
      else
        format.html { render :new }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meetings/1
  # PATCH/PUT /meetings/1.json
  def update
    respond_to do |format|
      if @meeting.update(meeting_params)
        format.html { redirect_to @meeting, notice: 'Meeting was successfully updated.' }
        format.json { render :show, status: :ok, location: @meeting }
      else
        format.html { render :edit }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meetings/1
  # DELETE /meetings/1.json
  def destroy
    # @team = Team.find(params[:id])
    # puts @team
    puts @meeting
    @meeting.destroy
    respond_to do |format|
      format.html notice: 'Meeting was successfully destroyed.'
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meeting
      @meeting = Meeting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def meeting_params
      params.require(:meeting).permit(:name, :start_time, :end_time, :user_id, :team_id)
    end
end
