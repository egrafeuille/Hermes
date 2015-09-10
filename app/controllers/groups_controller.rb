class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]

  # GET /groups
  # GET /groups.json
  def index
    @groups = Group.where(trainer_id: current_user.id)
    # @groups = Group.all
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
  end

  # GET /groups/new
  def new
    @group = Group.new(:trainer_id => current_user.id)
    # @available_players = User.players.where({:trainer_id => current_user.id, :group_id => nil})
    # @selected_players = @group.users.build
  end

  # GET /groups/1/edit
  def edit
    # @available_players = User.players.where(:trainer_id => current_user.id).where(:group_id.nil?)
    # @selected_players = @group.users
  end

  # POST /groups
  # POST /groups.json
  def create
    @group = Group.new(group_params)
    
    # params[:members][:id].each do |member|
      # if !member.empty?
        # @group.users << User.find(member) 
      # end
    # end

    respond_to do |format|
      if @group.save
        format.html { redirect_to @group, notice: 'Group was successfully created.' }
        # format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new }
        # format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
    # params[:members][:id].each do |member|
      # if !member.empty?
        # if XXX
        # @group.users << User.find(member) 
      # end
    # end

    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        # format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit }
        # format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
      # format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
      # params.require(:group).permit(:name, :trainer_id, members: [])
      params.require(:group).permit(:name, :trainer_id)
    end    
end
