class MovesController < ApplicationController
  before_action :set_move, only: [:show, :edit, :update, :destroy]
  # before_filter :require_login

  # GET /moves
  # GET /moves.json
  def index
      @moves = Move.all
  end

  # GET /moves/1
  # GET /moves/1.json
  def show
    @disabled_mode = true
  end

  # GET /moves/new
  def new
    @disabled_mode = false 
    if(params.has_key?(:parent_id))   
      @move = Move.new(:parent_id => params[:parent_id], :type => child_type)
    else
      @move = Move.new(:type => 'Macro')
    end
  end

  # GET /moves/1/edit
  def edit
    @disabled_mode = false
  end

  # POST /moves
  # POST /moves.json
  def create
    @move = Move.new(move_params)

    respond_to do |format|
      if @move.save
        format.html { redirect_to @move, notice: 'Move was successfully created.' }
        # format.json { render :show, status: :created, location: @move }
      else
        format.html { render :new }
        # format.json { render json: @move.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /moves/1
  # PATCH/PUT /moves/1.json
  def update
    respond_to do |format|
      if @move.update(move_params)
        format.html { redirect_to @move, notice: 'Move was successfully updated.' }
        # format.json { render :show, status: :ok, location: @move }
      else
        format.html { render :edit }
        # format.json { render json: @move.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /moves/1
  # DELETE /moves/1.json
  def destroy
    @move.destroy
    respond_to do |format|
      format.html { redirect_to moves_url, notice: 'Move was successfully destroyed.' }
      # format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_move
      @move = Move.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def move_params
      params.require(:move).permit(:name, :notes, :start_date, :end_date, :distance, :duration, :type, :parent_id,
            steps_attributes: [:id, :name, :notes, :times, :distance, :duration, :intensity, :pace, :rest, :_destroy])
    end
    
    def child_type
      parent = Move.find(params[:parent_id])
      child_type = case parent.type
      when 'Macro' then 'Meso'
      when 'Meso' then 'Micro'
      when 'Micro' then 'Nano'
      else 'Invalid Type'
      end
    end
end
