class MesosController < ApplicationController
  before_action :set_meso, only: [:show, :edit, :update, :destroy]

  # GET /mesos
  # GET /mesos.json
  def index
    @mesos = Meso.all
  end

  # GET /mesos/1
  # GET /mesos/1.json
  def show
  end

  # GET /mesos/new
  def new
    @meso = Meso.new
  end

  # GET /mesos/1/edit
  def edit
  end

  # POST /mesos
  # POST /mesos.json
  def create
    @meso = Meso.new(meso_params)

    respond_to do |format|
      if @meso.save
        format.html { redirect_to @meso, notice: 'Meso cycle was successfully created.' }
        format.json { render :show, status: :created, location: @meso }
      else
        format.html { render :new }
        format.json { render json: @meso.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mesos/1
  # PATCH/PUT /mesos/1.json
  def update
    respond_to do |format|
      if @meso.update(meso_params)
        format.html { redirect_to @meso, notice: 'Meso cycle was successfully updated.' }
        format.json { render :show, status: :ok, location: @meso }
      else
        format.html { render :edit }
        format.json { render json: @meso.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mesos/1
  # DELETE /mesos/1.json
  def destroy
    @meso.destroy
    respond_to do |format|
      format.html { redirect_to mesos_url, notice: 'Meso cycle was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meso
      @meso = Meso.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def meso_params
      params.require(:meso).permit(:macro_id, :name, :notes, :volume)
    end
end
